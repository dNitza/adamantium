# frozen_string_literal: true

module Admin
  module Actions
    module Posts
      class CreateHighlight < Admin::Action
        include Deps["commands.highlight.create"]

        def handle(req, res)
          create.call(post_id: req.params[:id], text: req.params[:text])

          res.redirect_to "/admin/posts/#{req.params[:id]}"
        end
      end
    end
  end
end
