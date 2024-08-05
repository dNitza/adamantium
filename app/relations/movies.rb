# frozen_string_literal: true

module Adamantium
  module Relations
    class Movies < Adamantium::DB::Relation
      schema :movies, infer: true

      auto_struct(true)
    end
  end
end
