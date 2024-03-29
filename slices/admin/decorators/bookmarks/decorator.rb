# frozen_string_literal: false

# auto_register: false

module Admin
  module Decorators
    module Bookmarks
      class Decorator < SimpleDelegator
        def display_published_at
          published_at.strftime("%e %B, %Y")
        end

        def display_title
          "🔖: #{name}"
        end

        def feed_content
          content || ""
        end

        def permalink
          "#{Hanami.app.settings.micropub_site_url}/bookmark/#{slug}"
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

        def youtube_embed
          pattern = /watch[?]v=(\w*)/i
          code = url.scan(pattern).flatten.first
          if code
            "<div class='video-container'><iframe width='100%' src='https://www.youtube.com/embed/#{code}' title='YouTube video player' frameborder='0' allow='accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share' allowfullscreen></iframe></div>"
          end
        end
      end
    end
  end
end
