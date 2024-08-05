module Micropub
  module Repos
    class PodcastRepo < Adamantium::DB::Repo[:podcasts]
      commands :create

      def listing
        podcasts.order(:name).to_a
      end

      def delete_all
        podcasts.delete
      end
    end
  end
end
