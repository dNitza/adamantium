module Adamantium
  module Actions
    module Bookmarks
      class Metadata < Action
        include Deps["views.bookmarks.metadata"]

        def handle(req, res)
          res.render metadata, id: req.params[:id]
        end
      end
    end
  end
end
