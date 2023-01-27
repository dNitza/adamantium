# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class PostTags < ROM::Relation[:sql]
        schema :post_tags, infer: true do
          associations do
            belongs_to :post
            belongs_to :tag
          end
        end

        auto_struct(true)
      end
    end
  end
end
