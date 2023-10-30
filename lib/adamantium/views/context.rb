module Adamantium
  module Views
    class Context < Hanami::View::Context
      include Hanami::View::ContextHelpers::ContentHelpers

      def initialize(**options)
        @options = options
        super(**options)
      end

      def asset_by_name(name)
        if Hanami.env == :development
          "/assets/#{name}"
        else
          assets[name]
        end
      end
    end
  end
end
