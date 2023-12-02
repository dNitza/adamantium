module Adamantium
  module Repos
    class PodcastScrobbleRepo < Adamantium::Repo[:podcast_scrobbles]
      commands :create

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
    end
  end
end
