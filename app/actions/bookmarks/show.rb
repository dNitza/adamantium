module Adamantium
  module Actions
    module Bookmarks
      class Show < Action
        include Deps["views.bookmarks.show"]
        def handle(req, res)
          res.render show, slug: req.params[:slug]
        end
      end
    end
  end
end
