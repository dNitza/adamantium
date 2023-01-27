# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class Posts < ROM::Relation[:sql]
        schema :posts, infer: true do
          associations do
            has_many :post_tags
            has_many :tags, through: :post_tags
          end
        end

        auto_struct(true)

        def published
          where(self[:published_at] <= Time.now)
        end
      end
    end
  end
end
