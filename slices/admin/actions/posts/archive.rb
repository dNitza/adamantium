module Admin
  module Actions
    module Posts
      class Archive < Action

        include Deps["repos.post_repo"]

        def handle(req, res)
          post_id = req.params[:id]

          post_repo.archive(id: post_id)
        end
      end
    end
  end
end