module Main
  module Views
    module RecentlyPlayedGames
      class Index < Main::View
        config.layout = false

        include Deps["queries.posts.recent_games"]

        expose :recently_played_games do |recently_played_result|
          # raise recently_played_result["data"].inspect
          recently_played_result.map do |game|
            {
              name: game["name"],
              playtime_forever: game["playtime_forever"].to_i / 60,
            }
          end
        end

        private_expose :recently_played_result do
          recent_games.call
        end
      end
    end
  end
end
