module Admin
  module Actions
    module Pages
      class Edit < Action
        include Deps["views.pages.edit"]

        def handle(req, res)
          res.render edit, slug: req.params[:slug]
        end
      end
    end
  end
end
