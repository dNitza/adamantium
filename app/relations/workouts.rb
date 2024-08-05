# frozen_string_literal: true

module Adamantium
  module Relations
    class Workouts < Adamantium::DB::Relation
      schema :workouts, infer: true

      auto_struct(true)
    end
  end
end
