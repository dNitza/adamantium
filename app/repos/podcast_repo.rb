module Adamantium
  module Repos
    class PodcastRepo < Adamantium::Repo[:podcasts]
      def listing
        podcasts.order(:name).to_a
      end
    end
  end
end
