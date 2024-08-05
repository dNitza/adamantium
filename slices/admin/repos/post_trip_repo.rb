module Admin
  module Repos
    class PostTripRepo < Adamantium::DB::Repo[:post_trips]
      commands :create

      def remove(trip_id:, post_id:)
        post_trips.where(trip_id: trip_id, post_id: post_id).delete
      end
    end
  end
end
