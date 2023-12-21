require "rack"
require "rack/contrib"

module Adamantium
  module Middleware
    class HeaderFix
      HEADERS_KLASS = (Rack.release < "3") ? Rack::Utils::HeaderHash : Rack::Headers
      private_constant :HEADERS_KLASS

      def initialize(app, &block)
        @app = app
        @block = block
      end

      def call(env)
        response = @app.call(env)
        headers = HEADERS_KLASS.new.merge(response[1])
        @block.call(headers, env)
        response[1] = headers
        response
      end
    end
  end
end
