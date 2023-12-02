# frozen_string_literal: true

module Adamantium
  module Relations
    class PodcastScrobbles < ROM::Relation[:sql]
      schema :podcast_scrobbles, infer: true

      auto_struct(true)
    end
  end
end
