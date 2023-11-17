# frozen_string_literal: true

module Adamantium
  module Relations
    class Podcasts < ROM::Relation[:sql]
      schema :podcasts, infer: true

      auto_struct(true)
    end
  end
end
