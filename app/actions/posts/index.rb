module Adamantium
  module Actions
    module Posts
      class Index < Action
        include Deps["views.posts.index"]
        def handle(req, res)
          res.render index, query: req.params[:q]
        end
      end
    end
  end
end
