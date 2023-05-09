module Admin
  module Commands
    module Trips
      class Create
        include Dry::Monads[:result]
        include Deps["repos.trip_repo"]

        def call(trip:)
          trip_repo.create(trip)

          Success()
        end
      end
    end
  end
end
