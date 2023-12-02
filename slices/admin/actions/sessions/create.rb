module Admin
  module Actions
    module Sessions
      class Create < Action
        include Deps["commands.sessions.create"]

        def handle(req, res)
          create.call(email: req.params[:email])

          res.redirect_to "/admin"
        end
      end
    end
  end
end
