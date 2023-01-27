module Adamantium
  module Actions
    module Pages
      class Show < Action
        include Deps["views.pages.show"]

        def handle(req, res)
          slug = req.params[:slug]

          res.render show, slug: slug
        end
      end
    end
  end
end
