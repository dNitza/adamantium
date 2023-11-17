# frozen_string_literal: true

module Adamantium
  module Relations
    class AutoTaggings < ROM::Relation[:sql]
      schema :auto_taggings, infer: true do
        associations do
          belongs_to :tag
        end
      end

      auto_struct(true)
    end
  end
end
