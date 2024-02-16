module Main
  module Repos
    class TripRepo < Adamantium::Repo[:trips]
      def fetch!(id)
        trips
          .where(id: id)
          .combine(posts: :tags)
          .one!
      end

      def list
        trips
          .published
          .order(:start_date)
          .reverse
          .to_a
      end
    end
  end
end
