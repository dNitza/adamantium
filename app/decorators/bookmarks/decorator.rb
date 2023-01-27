# frozen_string_literal: false

# auto_register: false

module Adamantium
  module Decorators
    module Bookmarks
      class Decorator < SimpleDelegator
        def display_published_at
          published_at.strftime("%e %B, %Y")
        end
      end
    end
  end
end
