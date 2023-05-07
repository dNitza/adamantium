module Admin
  module Actions
    module Bookmarks
      class Archive < Action

        include Deps["repos.bookmark_repo"]

        def handle(req, res)
          bookmark_id = req.params[:id]

          bookmark_repo.archive(id: bookmark_id)
        end
      end
    end
  end
end