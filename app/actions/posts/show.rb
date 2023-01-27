module Adamantium
  module Actions
    module Posts
      class Show < Action
        include Deps["views.posts.show"]

        def handle(req, res)
          slug = req.params[:slug]

          res.render show, slug: slug
        end
      end
    end
  end
end
