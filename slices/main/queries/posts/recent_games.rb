require "steam-api"

module Main
  module Queries
    module Posts
      class RecentGames
        include Deps["settings"]

        def call
          Steam.apikey = settings.steam_api_key
          Steam::Player.recently_played_games(settings.steam_user_id).fetch("games", []).take(2)
        end
      end
    end
  end
end
