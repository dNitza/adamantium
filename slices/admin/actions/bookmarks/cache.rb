module Admin
  module Actions
    module Bookmarks
      class Cache < Action
        include Deps["commands.bookmarks.cache"]

        def handle(req, res)
          bookmark_id = req.params[:id]

          res.body = if cache.call(bookmark_id: bookmark_id).success?
            "Success"
          else
            "Failed"
          end
        end
      end
    end
  end
end
