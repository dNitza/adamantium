module Adamantium
  module Views
    module RecentlyPlayed
      class Index < Adamantium::View
        config.layout = false

        include Deps["queries.posts.recently_played"]

        expose :recently_played_music do |recently_played_result|
          # raise recently_played_result["data"].inspect
          JSON.parse(recently_played_result)["data"].reject{ |a| a["type"] != "albums" }.map do |album|
            {
              artist: album["attributes"]["artistName"],
              name: album["attributes"]["name"],
              image: album["attributes"]["artwork"]["url"].gsub("{w}", "256").gsub("{h}", "256"),
              href: album["attributes"]["url"]
            }
          end
        end

        private_expose :recently_played_result do
          recently_played.call
        end
      end
    end
  end
end
