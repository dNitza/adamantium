# frozen_string_literal: false

# auto_register: false

module Adamantium
  module Decorators
    module Bookmarks
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
          :bookmark
        end

        def syndicated_to
          syndication_sources.map do |source, url|
            {
              location: source,
              url: url
            }
          end
        end
      end
    end
  end
end
