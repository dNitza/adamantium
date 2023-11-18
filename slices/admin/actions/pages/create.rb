module Admin
  module Actions
    module Pages
      class Create < Action
        include Deps["commands.pages.create"]

        def handle(req, res)
          create.call(page: req.params[:page])

          res.redirect_to "/admin/pages"
        end
      end
    end
  end
end
