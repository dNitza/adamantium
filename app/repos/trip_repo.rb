module Adamantium
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
          .combine(:posts)
          .order(:start_date)
          .to_a
      end
    end
  end
end
