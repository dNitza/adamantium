module Admin
  module Actions
    module Tags
      class Index < Action

        include Deps["views.tags.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end