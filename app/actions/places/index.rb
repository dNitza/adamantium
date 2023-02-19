module Adamantium
  module Actions
    module Places
      class Index < Action
        include Deps["views.places.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
