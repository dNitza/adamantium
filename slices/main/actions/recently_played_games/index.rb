require "time_math"

module Main
  module Actions
    module RecentlyPlayedGames
      class Index < Action
        include Deps["views.recently_played_games.index"]

        def handle(req, res)
          res.body = cache(key: "recently_played_games", content_proc: -> { index.call.to_str })
        end
      end
    end
  end
end
