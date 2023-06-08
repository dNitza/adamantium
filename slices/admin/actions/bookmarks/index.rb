module Admin
  module Actions
    module Bookmarks
      class Index < Action
        include Deps["views.bookmarks.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
