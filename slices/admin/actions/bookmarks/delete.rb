module Admin
  module Actions
    module Bookmarks
      class Delete < Action
        include Deps["repos.bookmark_repo", "repos.post_tag_repo"]

        def handle(req, res)
          bookmark_id = req.params[:id]

          post_tag_repo.delete_by_post_id(post_id: bookmark_id)
          bookmark_repo.delete(id: bookmark_id)
        end
      end
    end
  end
end
