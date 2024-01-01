--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: que_validate_tags(jsonb); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.que_validate_tags(tags_array jsonb) RETURNS boolean
    LANGUAGE sql
    AS $$
  SELECT bool_and(
    jsonb_typeof(value) = 'string'
    AND
    char_length(value::text) <= 100
  )
  FROM jsonb_array_elements(tags_array)
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: que_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.que_jobs (
    priority smallint DEFAULT 100 NOT NULL,
    run_at timestamp with time zone DEFAULT now() NOT NULL,
    id bigint NOT NULL,
    job_class text NOT NULL,
    error_count integer DEFAULT 0 NOT NULL,
    last_error_message text,
    queue text DEFAULT 'default'::text NOT NULL,
    last_error_backtrace text,
    finished_at timestamp with time zone,
    expired_at timestamp with time zone,
    args jsonb DEFAULT '[]'::jsonb NOT NULL,
    data jsonb DEFAULT '{}'::jsonb NOT NULL,
    job_schema_version integer NOT NULL,
    kwargs jsonb DEFAULT '{}'::jsonb NOT NULL,
    CONSTRAINT error_length CHECK (((char_length(last_error_message) <= 500) AND (char_length(last_error_backtrace) <= 10000))),
    CONSTRAINT job_class_length CHECK ((char_length(
CASE job_class
    WHEN 'ActiveJob::QueueAdapters::QueAdapter::JobWrapper'::text THEN ((args -> 0) ->> 'job_class'::text)
    ELSE job_class
END) <= 200)),
    CONSTRAINT queue_length CHECK ((char_length(queue) <= 100)),
    CONSTRAINT valid_args CHECK ((jsonb_typeof(args) = 'array'::text)),
    CONSTRAINT valid_data CHECK (((jsonb_typeof(data) = 'object'::text) AND ((NOT (data ? 'tags'::text)) OR ((jsonb_typeof((data -> 'tags'::text)) = 'array'::text) AND (jsonb_array_length((data -> 'tags'::text)) <= 5) AND public.que_validate_tags((data -> 'tags'::text))))))
)
WITH (fillfactor='90');


--
-- Name: TABLE que_jobs; Type: COMMENT; Schema: public; Owner: -
--

COMMENT ON TABLE public.que_jobs IS '7';


--
-- Name: que_determine_job_state(public.que_jobs); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.que_determine_job_state(job public.que_jobs) RETURNS text
    LANGUAGE sql
    AS $$
  SELECT
    CASE
    WHEN job.expired_at  IS NOT NULL    THEN 'expired'
    WHEN job.finished_at IS NOT NULL    THEN 'finished'
    WHEN job.error_count > 0            THEN 'errored'
    WHEN job.run_at > CURRENT_TIMESTAMP THEN 'scheduled'
    ELSE                                     'ready'
    END
$$;


--
-- Name: que_job_notify(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.que_job_notify() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    locker_pid integer;
    sort_key json;
  BEGIN
    -- Don't do anything if the job is scheduled for a future time.
    IF NEW.run_at IS NOT NULL AND NEW.run_at > now() THEN
      RETURN null;
    END IF;

    -- Pick a locker to notify of the job's insertion, weighted by their number
    -- of workers. Should bounce pseudorandomly between lockers on each
    -- invocation, hence the md5-ordering, but still touch each one equally,
    -- hence the modulo using the job_id.
    SELECT pid
    INTO locker_pid
    FROM (
      SELECT *, last_value(row_number) OVER () + 1 AS count
      FROM (
        SELECT *, row_number() OVER () - 1 AS row_number
        FROM (
          SELECT *
          FROM public.que_lockers ql, generate_series(1, ql.worker_count) AS id
          WHERE
            listening AND
            queues @> ARRAY[NEW.queue] AND
            ql.job_schema_version = NEW.job_schema_version
          ORDER BY md5(pid::text || id::text)
        ) t1
      ) t2
    ) t3
    WHERE NEW.id % count = row_number;

    IF locker_pid IS NOT NULL THEN
      -- There's a size limit to what can be broadcast via LISTEN/NOTIFY, so
      -- rather than throw errors when someone enqueues a big job, just
      -- broadcast the most pertinent information, and let the locker query for
      -- the record after it's taken the lock. The worker will have to hit the
      -- DB in order to make sure the job is still visible anyway.
      SELECT row_to_json(t)
      INTO sort_key
      FROM (
        SELECT
          'job_available' AS message_type,
          NEW.queue       AS queue,
          NEW.priority    AS priority,
          NEW.id          AS id,
          -- Make sure we output timestamps as UTC ISO 8601
          to_char(NEW.run_at AT TIME ZONE 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.US"Z"') AS run_at
      ) t;

      PERFORM pg_notify('que_listener_' || locker_pid::text, sort_key::text);
    END IF;

    RETURN null;
  END
$$;


--
-- Name: que_state_notify(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.que_state_notify() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
  DECLARE
    row record;
    message json;
    previous_state text;
    current_state text;
  BEGIN
    IF TG_OP = 'INSERT' THEN
      previous_state := 'nonexistent';
      current_state  := public.que_determine_job_state(NEW);
      row            := NEW;
    ELSIF TG_OP = 'DELETE' THEN
      previous_state := public.que_determine_job_state(OLD);
      current_state  := 'nonexistent';
      row            := OLD;
    ELSIF TG_OP = 'UPDATE' THEN
      previous_state := public.que_determine_job_state(OLD);
      current_state  := public.que_determine_job_state(NEW);

      -- If the state didn't change, short-circuit.
      IF previous_state = current_state THEN
        RETURN null;
      END IF;

      row := NEW;
    ELSE
      RAISE EXCEPTION 'Unrecognized TG_OP: %', TG_OP;
    END IF;

    SELECT row_to_json(t)
    INTO message
    FROM (
      SELECT
        'job_change' AS message_type,
        row.id       AS id,
        row.queue    AS queue,

        coalesce(row.data->'tags', '[]'::jsonb) AS tags,

        to_char(row.run_at AT TIME ZONE 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.US"Z"') AS run_at,
        to_char(now()      AT TIME ZONE 'UTC', 'YYYY-MM-DD"T"HH24:MI:SS.US"Z"') AS time,

        CASE row.job_class
        WHEN 'ActiveJob::QueueAdapters::QueAdapter::JobWrapper' THEN
          coalesce(
            row.args->0->>'job_class',
            'ActiveJob::QueueAdapters::QueAdapter::JobWrapper'
          )
        ELSE
          row.job_class
        END AS job_class,

        previous_state AS previous_state,
        current_state  AS current_state
    ) t;

    PERFORM pg_notify('que_state', message::text);

    RETURN null;
  END
$$;


--
-- Name: auto_taggings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auto_taggings (
    id integer NOT NULL,
    title_contains text,
    body_contains text,
    tag_id integer NOT NULL
);


--
-- Name: auto_taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.auto_taggings ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auto_taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: login_tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.login_tokens (
    id integer NOT NULL,
    user_id uuid NOT NULL,
    token uuid NOT NULL,
    created_at timestamp with time zone DEFAULT now()
);


--
-- Name: login_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.login_tokens ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.login_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: movies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title text NOT NULL,
    year integer,
    url text NOT NULL,
    watched_at date,
    imdb_id text
);


--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.movies ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.movies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    name text NOT NULL,
    content text NOT NULL,
    slug text NOT NULL,
    published_at date
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.pages ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: podcasts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.podcasts (
    id integer NOT NULL,
    name text NOT NULL,
    url text NOT NULL,
    overcast_id text NOT NULL
);


--
-- Name: podcasts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.podcasts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.podcasts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: post_tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_tags (
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);


--
-- Name: post_trips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.post_trips (
    post_id integer NOT NULL,
    trip_id integer NOT NULL
);


--
-- Name: posts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    name text DEFAULT ''::text,
    content text,
    published_at timestamp without time zone,
    slug text NOT NULL,
    url text,
    post_type text,
    syndication_sources jsonb DEFAULT '{}'::json,
    photos json DEFAULT '[]'::json NOT NULL,
    location text,
    cached_content text,
    book_status text,
    book_author text
);


--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.posts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: que_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.que_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: que_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.que_jobs_id_seq OWNED BY public.que_jobs.id;


--
-- Name: que_lockers; Type: TABLE; Schema: public; Owner: -
--

CREATE UNLOGGED TABLE public.que_lockers (
    pid integer NOT NULL,
    worker_count integer NOT NULL,
    worker_priorities integer[] NOT NULL,
    ruby_pid integer NOT NULL,
    ruby_hostname text NOT NULL,
    queues text[] NOT NULL,
    listening boolean NOT NULL,
    job_schema_version integer DEFAULT 1,
    CONSTRAINT valid_queues CHECK (((array_ndims(queues) = 1) AND (array_length(queues, 1) IS NOT NULL))),
    CONSTRAINT valid_worker_priorities CHECK (((array_ndims(worker_priorities) = 1) AND (array_length(worker_priorities, 1) IS NOT NULL)))
);


--
-- Name: que_values; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.que_values (
    key text NOT NULL,
    value jsonb DEFAULT '{}'::jsonb NOT NULL,
    CONSTRAINT valid_value CHECK ((jsonb_typeof(value) = 'object'::text))
)
WITH (fillfactor='90');


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    filename text NOT NULL
);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tags (
    id integer NOT NULL,
    label text NOT NULL,
    slug text NOT NULL
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tags ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: top_tracks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.top_tracks (
    artist text,
    name text,
    url text,
    mb_id text,
    post_id integer NOT NULL
);


--
-- Name: trips; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trips (
    id integer NOT NULL,
    name text NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    subtitle text,
    summary text
);


--
-- Name: trips_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.trips ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    email text NOT NULL
);


--
-- Name: webmentions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.webmentions (
    id integer NOT NULL,
    type text DEFAULT ''::text NOT NULL,
    author_name text DEFAULT ''::text NOT NULL,
    author_photo text DEFAULT ''::text NOT NULL,
    author_url text DEFAULT ''::text,
    published_at timestamp without time zone,
    content_html text DEFAULT ''::text NOT NULL,
    content_text text DEFAULT ''::text NOT NULL,
    source_url text DEFAULT ''::text NOT NULL,
    target_url text DEFAULT ''::text NOT NULL,
    post_id integer
);


--
-- Name: webmentions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.webmentions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.webmentions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: workouts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.workouts (
    id integer NOT NULL,
    path text NOT NULL,
    distance double precision NOT NULL,
    published_at timestamp without time zone,
    duration double precision NOT NULL
);


--
-- Name: workouts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.workouts ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.workouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: que_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.que_jobs ALTER COLUMN id SET DEFAULT nextval('public.que_jobs_id_seq'::regclass);


--
-- Name: auto_taggings auto_taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auto_taggings
    ADD CONSTRAINT auto_taggings_pkey PRIMARY KEY (id);


--
-- Name: login_tokens login_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.login_tokens
    ADD CONSTRAINT login_tokens_pkey PRIMARY KEY (id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: podcasts podcasts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.podcasts
    ADD CONSTRAINT podcasts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: posts posts_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_slug_key UNIQUE (slug);


--
-- Name: que_jobs que_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.que_jobs
    ADD CONSTRAINT que_jobs_pkey PRIMARY KEY (id);


--
-- Name: que_lockers que_lockers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.que_lockers
    ADD CONSTRAINT que_lockers_pkey PRIMARY KEY (pid);


--
-- Name: que_values que_values_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.que_values
    ADD CONSTRAINT que_values_pkey PRIMARY KEY (key);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (filename);


--
-- Name: tags tags_label_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_label_key UNIQUE (label);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tags tags_slug_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_slug_key UNIQUE (slug);


--
-- Name: top_tracks top_tracks_post_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.top_tracks
    ADD CONSTRAINT top_tracks_post_id_key UNIQUE (post_id);


--
-- Name: trips trips_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: webmentions webmentions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webmentions
    ADD CONSTRAINT webmentions_pkey PRIMARY KEY (id);


--
-- Name: workouts workouts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.workouts
    ADD CONSTRAINT workouts_pkey PRIMARY KEY (id);


--
-- Name: pages_slug_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX pages_slug_index ON public.pages USING btree (slug);


--
-- Name: que_jobs_args_gin_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX que_jobs_args_gin_idx ON public.que_jobs USING gin (args jsonb_path_ops);


--
-- Name: que_jobs_data_gin_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX que_jobs_data_gin_idx ON public.que_jobs USING gin (data jsonb_path_ops);


--
-- Name: que_jobs_kwargs_gin_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX que_jobs_kwargs_gin_idx ON public.que_jobs USING gin (kwargs jsonb_path_ops);


--
-- Name: que_poll_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX que_poll_idx ON public.que_jobs USING btree (job_schema_version, queue, priority, run_at, id) WHERE ((finished_at IS NULL) AND (expired_at IS NULL));


--
-- Name: que_jobs que_job_notify; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER que_job_notify AFTER INSERT ON public.que_jobs FOR EACH ROW WHEN ((NOT (COALESCE(current_setting('que.skip_notify'::text, true), ''::text) = 'true'::text))) EXECUTE FUNCTION public.que_job_notify();


--
-- Name: que_jobs que_state_notify; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER que_state_notify AFTER INSERT OR DELETE OR UPDATE ON public.que_jobs FOR EACH ROW WHEN ((NOT (COALESCE(current_setting('que.skip_notify'::text, true), ''::text) = 'true'::text))) EXECUTE FUNCTION public.que_state_notify();


--
-- Name: auto_taggings auto_taggings_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.auto_taggings
    ADD CONSTRAINT auto_taggings_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: post_tags post_tags_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: post_tags post_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_tags
    ADD CONSTRAINT post_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: post_trips post_trips_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_trips
    ADD CONSTRAINT post_trips_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: post_trips post_trips_trip_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.post_trips
    ADD CONSTRAINT post_trips_trip_id_fkey FOREIGN KEY (trip_id) REFERENCES public.trips(id);


--
-- Name: top_tracks top_tracks_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.top_tracks
    ADD CONSTRAINT top_tracks_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- Name: webmentions webmentions_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.webmentions
    ADD CONSTRAINT webmentions_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id);


--
-- PostgreSQL database dump complete
--

