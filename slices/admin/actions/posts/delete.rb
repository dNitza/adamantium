module Admin
  module Actions
    module Posts
      class Delete < Action
        include Deps["repos.post_repo", "repos.post_tag_repo"]

        def handle(req, res)
          post_id = req.params[:id]

          post_tag_repo.delete_by_post_id(post_id: post_id)
          post_repo.delete(id: post_id)
        end
      end
    end
  end
end
