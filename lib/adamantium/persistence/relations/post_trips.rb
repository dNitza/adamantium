# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class PostTrips < ROM::Relation[:sql]
        schema :post_trips, infer: true do
          associations do
            belongs_to :post
            belongs_to :trip
          end
        end

        auto_struct(true)
      end
    end
  end
end
