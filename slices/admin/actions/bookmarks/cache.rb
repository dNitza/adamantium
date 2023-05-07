module Admin
  module Actions
    module Bookmarks
      class Cache < Action

        include Deps["commands.bookmarks.cache"]

        def handle(req, res)
          bookmark_id = req.params[:id]

          if cache.(bookmark_id: bookmark_id).success?
            res.body = "Success"
          else
            res.body = "Failed"
          end
        end
      end
    end
  end
end