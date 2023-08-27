module Admin
  module Commands
    module Trips
      class Update
        include Dry::Monads[:result]
        include Deps["repos.trip_repo", renderer: "renderers.markdown"]

        def call(id:, trip:)
          trip_repo.update(id, prepare(trip: trip))

          Success()
        end

        private

        def prepare(trip:)
          trip[:summary] = renderer.call(content: trip[:summary])
          trip
        end
      end
    end
  end
end
