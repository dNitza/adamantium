module Admin
  module Actions
    module Photos
      class Index < Action
        include Deps["views.photos.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
