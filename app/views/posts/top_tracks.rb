module Adamantium
  module Views
    module Posts
      class TopTracks < Adamantium::View
        config.layout = false

        expose :name do |track:|
          track["name"]
        end

        expose :artist do |track:|
          track.dig("artist", "content")
        end

        expose :image do |track:|
          track["image"].detect { |i| i["size"] == "small" }["content"]
        end

        expose :url do |track:|
          track["url"]
        end
      end
    end
  end
end
