# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class Movies < ROM::Relation[:sql]
        schema :movies, infer: true

        auto_struct(true)
      end
    end
  end
end
