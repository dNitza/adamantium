module Main
  module Repos
    class PodcastScrobbleRepo < Adamantium::DB::Repo[:podcast_scrobbles]
      def exists?(id:)
        !!podcast_scrobbles
          .where(overcast_id: id)
          .one
      end

      def listing
        podcast_scrobbles
          .order(Sequel.desc(:listened_at))
          .limit(5)
          .to_a
      end

      def for_timemachine(date:)
        podcast_scrobbles
          .where(listened_at: TimeMath.day.floor(date)...TimeMath.day.advance(date, +1))
          .to_a
      end
    end
  end
end
