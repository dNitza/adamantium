require "time_math"

module Adamantium
  module Actions
    module RecentlyPlayed
      class Index < Action
        include Deps["views.recently_played.index", "view_cache.cacher"]

        def handle(req, res)
          res.body = cacher.call(key: "recently_played", content: index.call.to_str, expiry: TimeMath.min.advance(Time.now, +10))
        end
      end
    end
  end
end
