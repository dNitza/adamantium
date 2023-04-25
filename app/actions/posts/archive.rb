module Adamantium
  module Actions
    module Posts
      class Archive < Action
        include Deps["views.posts.archive"]

        def handle(req, res)
          year = req.params[:year]

          res.render archive, year: year
        end
      end
    end
  end
end
