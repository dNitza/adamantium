module Admin
  module Actions
    module Posts
      class Update < Action
        include Deps["commands.posts.update"]

        def handle(req, res)
          update.(params: req.params)
          res.redirect "/admin/posts/#{req.params[:id]}"
        end
      end
    end
  end
end
