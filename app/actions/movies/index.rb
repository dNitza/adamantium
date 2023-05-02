module Adamantium
  module Actions
    module Movies
      class Index < Action
        include Deps["views.movies.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
