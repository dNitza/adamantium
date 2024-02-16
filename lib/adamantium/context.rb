module Adamantium
  class Context < Hanami::View::Context
    def initialize(**options)
      @options = options
      super(**options)
    end
  end
end
