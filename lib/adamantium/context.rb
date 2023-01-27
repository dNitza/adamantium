module Adamantium
  class Context < Hanami::View::Context
    def initialize(**options)
      @options = options
      super(**options)
    end

    def link_active? path
      # TODO: waiting for Hanami View to be released
      # to access current_path
      false
    end
  end
end
