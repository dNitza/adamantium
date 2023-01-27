module Adamantium
  module Actions
    module Tags
      class Show < Action
        include Deps["views.tags.show"]

        def handle(req, res)
          slug = req.params[:slug]

          res.render show, slug: slug
        end
      end
    end
  end
end
