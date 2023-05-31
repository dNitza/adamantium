module Admin
  module Actions
    module Posts
      class Publish < Action

        include Deps["repos.post_repo"]

        def handle(req, res)
          post_id = req.params[:id]

          post_repo.publish(id: post_id)
        end
      end
    end
  end
end