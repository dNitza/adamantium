module Adamantium
  module Actions
    module Places
      class MapPage < Action
        include Deps["views.places.map_page"]

        def handle(req, res)
          res.render map_page
        end
      end
    end
  end
end
