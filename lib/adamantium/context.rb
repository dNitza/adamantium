module Adamantium
  class Context < Hanami::View::Context
    include Hanami::View::ContextHelpers::ContentHelpers

    def initialize(**options)
      @options = options
      super(**options)
    end
  end
end
