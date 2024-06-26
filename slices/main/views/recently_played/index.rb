module Main
  module Views
    module RecentlyPlayed
      class Index < Main::View
        config.layout = false

        include Deps["queries.posts.recently_played"]

        expose :recently_played_music do |recently_played_result|
          JSON.parse(recently_played_result)["data"].reject { |a| a["type"] != "albums" }.map do |album|
            {
              artist: album["attributes"]["artistName"],
              name: album["attributes"]["name"],
              image: album["attributes"]["artwork"]["url"].gsub("{w}", "512").gsub("{h}", "512"),
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
