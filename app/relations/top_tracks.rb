# frozen_string_literal: true

module Adamantium
  module Relations
    class TopTracks < Adamantium::DB::Relation
      schema :top_tracks, infer: true

      auto_struct(true)
    end
  end
end
