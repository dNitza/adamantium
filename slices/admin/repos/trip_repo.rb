module Admin
  module Repos
    class TripRepo < Adamantium::Repo[:trips]
      commands :create

      def list
        trips.order(:start_date).to_a
      end

      def fetch(id)
        trips.where(id: id).one
      end
    end
  end
end
