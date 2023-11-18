module Admin
  module Actions
    module Pages
      class Update < Action
        include Deps["commands.pages.update"]

        def handle(req, res)
          update.call(page: req.params[:page])
          res.redirect "/admin/pages/#{req.params[:page][:slug]}/edit"
        end
      end
    end
  end
end
