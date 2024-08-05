require "time_math"

module Adamantium
  module Repos
    class PostRepo < Adamantium::DB::Repo[:posts]
      def recent(limit:)
        date = Time.now

        posts
          .where(post_type: "bookmark", is_read: false, published_at: TimeMath.day.advance(date, -7)...TimeMath.day.floor(date))
          .limit(limit)
          .published
          .order(Sequel.desc(:published_at))
          .to_a
      end

      def random(limit:, excluding:)
        posts
          .where(post_type: "bookmark", is_read: false)
          .exclude(id: excluding)
          .limit(limit)
          .published
          .order(Sequel.lit("random()"))
          .to_a
      end
    end
  end
end
