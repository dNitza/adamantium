# frozen_string_literal: true

module Admin
  module Actions
    module Posts
      class DeleteHighlight < Admin::Action
        include Deps["repos.highlight_repo"]

        def handle(req, res)
          highlight_repo.delete(req.params[:highlight_id])

          res.redirect_to "/admin/posts/#{req.params[:post_id]}"
        end
      end
    end
  end
end
