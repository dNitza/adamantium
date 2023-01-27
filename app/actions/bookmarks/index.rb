module Adamantium
  module Actions
    module Bookmarks
      class Index < Action
        include Deps["views.bookmarks.index"]

        def handle(req, res)
          res.render index, query: req.params[:q]
        end
      end
    end
  end
end
