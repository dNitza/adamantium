module Admin
  module Actions
    module Pages
      class Index < Action
        include Deps["views.pages.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
