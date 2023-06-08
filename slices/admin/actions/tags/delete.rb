module Admin
  module Actions
    module Tags
      class Delete < Action
        include Deps["repos.post_tag_repo", "repos.tag_repo"]

        def handle(req, res)
          tag_id = req.params[:id]

          post_tag_repo.delete(tag_id: tag_id)
          tag_repo.delete(tag_id: tag_id)
        end
      end
    end
  end
end
