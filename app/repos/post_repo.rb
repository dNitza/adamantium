module Adamantium
  module Repos
    class PostRepo < Adamantium::Repo[:posts]
      Sequel.extension :pg_json
      Sequel.extension :pg_json_ops

      def by_year(year:)
        posts
          .where(post_type: "post", location: nil)
          .exclude(name: nil)
          .published
          .where { Sequel.&(Sequel.extract(:year, :published_at) =~ year) }
          .combine(:tags)
          .to_a
      end

      def week_posts(limit: nil)
        posts
          .where(post_type: "post")
          .weekly
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def post_listing(limit: nil)
        posts
          .where(post_type: "post", location: nil)
          .exclude(name: nil)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def home_post_listing(limit: nil)
        posts
          .where(post_type: "post", location: nil)
          .exclude(name: nil)
          .non_weekly
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def photo_listing(limit: nil)
        posts
          .where(post_type: ["post", "checkin"])
          .where(Sequel[:photos].pg_json.array_length > 0)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def places_listing(limit: nil)
        posts
          .where(post_type: ["checkin", "post"])
          .exclude(location: nil)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def books_listing(limit: nil)
        posts
          .where(post_type: "book")
          .published
          .order(Sequel.asc(:name))
          .limit(limit)
          .to_a
      end

      def bookmark_listing(query: nil)
        base = posts
          .where(post_type: "bookmark")
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))

        query ? base.where(Sequel.ilike(:name, "%#{query}%")).to_a : base.to_a
      end

      def statuses_listing(limit: nil)
        posts
          .where(post_type: "post", name: nil)
          .exclude(Sequel.pg_jsonb_op(:syndication_sources).has_key?("instagram"))
          .published
          .combine(:tags, :webmentions)
          .node(:webmentions) { |webmention|
            webmention.where(type: "reply")
          }
          .order(Sequel.desc(:published_at))
          .limit(limit)
          .to_a
      end

      def latest_status
        posts
          .where(name: nil)
          .published
          .order(Sequel.desc(:published_at))
          .limit(1)
          .one
      end

      def last_location
        posts
          .where(post_type: "checkin")
          .published
          .order(Sequel.desc(:published_at))
          .limit(1)
          .one
      end

      def from_the_archives(start_date:, end_date:)
        # SELECT * FROM posts
        # WHERE EXTRACT(month FROM "published_at") >= 2
        # WHERE EXTRACT(month FROM "published_at") <= 2+
        # AND EXTRACT(day FROM "published_at") > 20
        # AND EXTRACT(day FROM "published_at") < 27
        # AND post_type = 'post';

        posts
          .where(post_type: "post")
          .published
          .where { Sequel.extract(:year, :published_at) < start_date.year }
          .where { Sequel.extract(:month, :published_at) >= start_date.month }
          .where { Sequel.extract(:month, :published_at) <= end_date.month }
          .where { Sequel.extract(:day, :published_at) >= start_date.day }
          .where { Sequel.extract(:day, :published_at) <= end_date.day }
          .to_a
      end

      def for_rss
        posts
          .where(post_type: "post", location: nil)
          .exclude(name: nil)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .to_a
      end

      def statuses_for_rss
        posts
          .where(post_type: "post", name: nil, location: nil)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .to_a
      end

      def fetch!(slug)
        posts
          .published
          .combine(:tags, :trips, :webmentions)
          .node(:webmentions) { |webmention|
            webmention.where(type: "reply")
          }
          .where(slug: slug)
          .one!
      end

      def find!(id)
        posts
          .by_pk(id)
          .one!
      end

      def post_years
        posts
          .where(post_type: "post", location: nil)
          .exclude(name: nil)
          .published
          .dataset
          .group_and_count(Sequel.extract(:year, :published_at).as(:year))
          .order(:year)
          .to_a
      end

      def search(term:)
        posts
          .where(post_type: "post", location: nil)
          .published
          .search(term: term)
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .to_a
      end
    end
  end
end
