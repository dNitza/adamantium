# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class Tags < ROM::Relation[:sql]
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
end
