# frozen_string_literal: true

module Adamantium
  module Relations
    class Highlights < Adamantium::DB::Relation
      schema :highlights, infer: true do
        associations do
          belongs_to :post
        end
      end

      auto_struct(true)
    end
  end
end
