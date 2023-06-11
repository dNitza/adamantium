# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class Trips < ROM::Relation[:sql]
        schema :trips, infer: true do
          associations do
            has_many :post_trips
            has_many :posts, through: :post_trips
          end
        end

        auto_struct(true)

        def published
          where(self[:start_date] <= Time.now)
        end
      end
    end
  end
end
