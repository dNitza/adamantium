# frozen_string_literal: false

# auto_register: false

module Adamantium
  module Decorators
    module Books
      class Decorator < SimpleDelegator
        def display_published_at
          published_at.strftime("%e %B, %Y")
        end

        def machine_published_at
          published_at.rfc2822
        end

        def syndicated?
          !syndication_sources.empty?
        end

        def template_type
          :book
        end
      end
    end
  end
end
