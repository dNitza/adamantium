module Adamantium
  module Middleware
    class BasicAuth < Rack::Auth::Basic
      def call(env)
        request = Rack::Request.new(env)
        if request.path.match(/^\/admin*/)
          # Execute basic authentication
          super(env)
        else
          # Pass basic authentication
          @app.call(env)
        end
      end
    end
  end
end
