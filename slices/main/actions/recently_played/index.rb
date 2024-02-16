require "time_math"

module Main
  module Actions
    module RecentlyPlayed
      class Index < Action
        include Deps["views.recently_played.index"]

        def handle(req, res)
          res.body = cache(key: "recently_played", content_proc: -> { index.call.to_str })
        end
      end
    end
  end
end
