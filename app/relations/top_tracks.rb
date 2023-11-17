# frozen_string_literal: true

module Adamantium
  module Relations
    class TopTracks < ROM::Relation[:sql]
      schema :top_tracks, infer: true

      auto_struct(true)
    end
  end
end
