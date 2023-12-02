module Admin
  module Actions
    module Sessions
      class Validate < Action
        include Deps["commands.sessions.validate"]

        def handle(req, res)
          user_id = validate.call(token: req.params[:token])
          session = req.env["rack.session"]

          session[:user_id] = user_id

          res.redirect_to "/admin"
        end
      end
    end
  end
end
