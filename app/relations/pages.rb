# frozen_string_literal: true

module Adamantium
  module Relations
    class Pages < ROM::Relation[:sql]
      schema :pages, infer: true

      auto_struct(true)

      def published
        where(self[:published_at] <= Time.now)
      end
    end
  end
end
