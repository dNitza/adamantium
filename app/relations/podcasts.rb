# frozen_string_literal: true

module Adamantium
  module Relations
    class Podcasts < Adamantium::DB::Relation
      schema :podcasts, infer: true

      auto_struct(true)
    end
  end
end
