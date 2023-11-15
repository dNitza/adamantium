module Micropub
  module Repos
    class WorkoutRepo < Adamantium::Repo[:workouts]
      commands :create, update: :by_pk
    end
  end
end
