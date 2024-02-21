module Main
  module Views
    module Workouts
      class Index < Main::View
        include Deps["repos.workout_repo"]

        expose :workouts_by_year do
          workout_repo
            .list
            .group_by { |wo|
              wo.published_at.year
            }
            .sort
        end
      end
    end
  end
end
