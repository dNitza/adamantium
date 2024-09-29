module Adamantium
  module Middleware
    class Authenticate
      def initialize(app, auth_proc)
        @app = app
        @auth_proc = auth_proc
      end

      def call(env)
        session = env["rack.session"]
        return [302, {"Location" => "/admin/login"}, []] unless @auth_proc.call(session[:user_id])

        @app.call(env)
      end
    end
  end
end
