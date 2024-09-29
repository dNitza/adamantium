module Admin
  module Actions
    module Posts
      class New < Action
        include Deps["views.posts.new"]

        def handle(req, res)
          res.render new
        end
      end
    end
  end
end
