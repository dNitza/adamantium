module Adamantium
  module Actions
    module Podcasts
      class Index < Action
        include Deps["views.podcasts.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
