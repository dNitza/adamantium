# frozen_string_literal: true

module Adamantium
  module Persistence
    module Relations
      class Webmentions < ROM::Relation[:sql]
        schema :webmentions, infer: true do
          associations do
            belongs_to :post
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
