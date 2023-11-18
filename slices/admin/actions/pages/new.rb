module Admin
  module Actions
    module Pages
      class New < Action
        include Deps["views.pages.new"]

        def handle(req, res)
          res.render new
        end
      end
    end
  end
end
