# frozen_string_literal: true

module Adamantium
  module Relations
    class PostTrips < Adamantium::DB::Relation
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
