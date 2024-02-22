module Adamantium
  module Repos
    class PostRepo < Adamantium::Repo[:posts]
      Sequel.extension :pg_json
      Sequel.extension :pg_json_ops

      def for_reminders(limit:)
        posts
          .where(post_type: "bookmark", is_read: false)
          .limit(limit)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .to_a
      end

    end
  end
end
