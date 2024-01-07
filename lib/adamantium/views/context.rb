module Adamantium
  module Views
    class Context < Hanami::View::Context
      include Hanami::View::ContextHelpers::ContentHelpers

      include Deps["repos.page_repo"]

      def initialize(**options)
        @options = options
        super(**options)
      end

      def pages
        page_repo.for_main_nav
      end

      def current_path
        request.fullpath
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
