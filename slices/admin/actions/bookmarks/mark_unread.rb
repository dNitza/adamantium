module Admin
  module Actions
    module Bookmarks
      class MarkUnread < Action
        include Deps["repos.bookmark_repo"]

        def handle(req, res)
          bookmark_id = req.params[:id]

          bookmark_repo.mark_unread(id: bookmark_id)
        end
      end
    end
  end
end
