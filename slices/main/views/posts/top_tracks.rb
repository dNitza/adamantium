module Main
  module Views
    module Posts
      class TopTracks < Main::View
        config.layout = false

        expose :name do |track:|
          track.name
        end

        expose :artist do |track:|
          track.artist
        end

        expose :url do |track:|
          track.url
        end
      end
    end
  end
end
