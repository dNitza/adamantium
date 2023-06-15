module Admin
  module Commands
    module Trips
      class RemovePost
        include Dry::Monads[:result]
        include Deps["repos.post_trip_repo"]

        def call(trip_id:, post_id:)
          post_trip_repo.remove(trip_id: trip_id, post_id: post_id)

          Success()
        end
      end
    end
  end
end
