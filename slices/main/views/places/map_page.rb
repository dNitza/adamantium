module Main
  module Views
    module Places
      class MapPage< Main::View
        include Deps["repos.post_repo"]

        config.layout = "map"

        expose :places do
          post_repo.places_listing.map do |post|
            p = Decorators::Posts::Decorator.new(post)
            [p.lon, p.lat]
          end
        end
      end
    end
  end
end
