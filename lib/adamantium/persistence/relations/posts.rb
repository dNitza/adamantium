# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class Posts < ROM::Relation[:sql]
        schema :posts, infer: true do
          associations do
            has_many :post_tags
            has_many :tags, through: :post_tags

            has_many :post_trips
            has_many :trips, through: :post_trips

            has_many :webmentions
          end
        end

        auto_struct(true)

        def published
          where(self[:published_at] <= Time.now)
        end

        def published_between(start_date, end_date)
          where(self[:published_at] >= start_date)
            .where(self[:published_at] <= end_date)
        end
      end
    end
  end
end
