module Adamantium
  module Actions
    module Site
      class Home < Action
        include Deps["views.site.home"]
        def handle(req, res)
          res.render home
        end
      end
    end
  end
end
