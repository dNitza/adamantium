module Admin
  module Commands
    module Trips
      class Update
        include Dry::Monads[:result]
        include Deps["repos.trip_repo"]

        def call(id:, trip:)
          trip_repo.update(id, trip)

          Success()
        end
      end
    end
  end
end
