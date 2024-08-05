# frozen_string_literal: true

module Adamantium
  module Relations
    class PodcastScrobbles < Adamantium::DB::Relation
      schema :podcast_scrobbles, infer: true

      auto_struct(true)
    end
  end
end
