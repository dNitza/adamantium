# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class Tags < ROM::Relation[:sql]
        schema :tags, infer: true do
          associations do
            belongs_to :post_tag
            belongs_to :post, through: :post_tag
          end
        end

        auto_struct(true)
      end
    end
  end
end
