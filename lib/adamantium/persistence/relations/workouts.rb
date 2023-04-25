# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class Workouts < ROM::Relation[:sql]
        schema :workouts, infer: true

        auto_struct(true)
      end
    end
  end
end
