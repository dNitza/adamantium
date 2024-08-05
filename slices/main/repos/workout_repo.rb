module Main
  module Repos
    class WorkoutRepo < Adamantium::DB::Repo[:workouts]
      def list
        workouts.order(:published_at).to_a
      end
    end
  end
end
