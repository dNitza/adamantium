module Adamantium
  module Middleware
    class ProcessParams
      def initialize(app)
        @app = app
      end

      def call(env)
        # NOOP for now.
        @app.call(env)
      end
    end
  end
end
