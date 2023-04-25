
require "securerandom"
require "dry/monads"
require "filemagic"

module Adamantium
  module Commands
    module Workouts
      class Create < Command
        include Deps["repos.workout_repo"]
        include Dry::Monads[:result]

        def call(svg:, distance:)
          workout_repo.create(path: svg, distance: distance, published_at: Time.now)
        end
      end
    end
  end
end
