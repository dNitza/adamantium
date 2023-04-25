module Adamantium
  module Repos
    class WorkoutRepo < Adamantium::Repo[:workouts]
      commands :create, update: :by_pk

      def list
        workouts.order(:published_at).to_a
      end
    end
  end
end