module Adamantium
  module Repos
    class TopTrackRepo < Adamantium::Repo[:top_tracks]
      def for_post(id:)
        top_tracks
          .where(post_id: id)
          .to_a
      end

      def upsert(post_id:, name:, artist:, url:, mb_id:)
        top_tracks
          .upsert({name: name, artist: artist, url: url, mb_id: mb_id, post_id: post_id},
            {target: :post_id, update: {name: name, artist: artist, url: url, mb_id: mb_id, post_id: post_id}})
      end
    end
  end
end
