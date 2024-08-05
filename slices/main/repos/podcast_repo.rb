module Main
  module Repos
    class PodcastRepo < Adamantium::DB::Repo[:podcasts]
      def listing
        podcasts.order(:name).to_a
      end
    end
  end
end
