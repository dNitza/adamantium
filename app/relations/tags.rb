# frozen_string_literal: true

module Adamantium
  module Relations
    class Tags < Adamantium::DB::Relation
      schema :tags, infer: true do
        associations do
          has_many :post_tags
          has_many :posts, through: :post_tags
        end
      end

      auto_struct(true)
    end
  end
end
