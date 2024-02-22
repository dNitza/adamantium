module Admin
  module Actions
    module Bookmarks
      class MarkRead < Action
        include Deps["repos.bookmark_repo"]

        def handle(req, res)
          bookmark_id = req.params[:id]

          bookmark_repo.mark_read(id: bookmark_id)
        end
      end
    end
  end
end
