# frozen_string_literal: false

# auto_register: false

require "rexml/parsers/pullparser"
require "sanitize"

module Adamantium
  module Decorators
    module Posts
      class Decorator < SimpleDelegator
        def syndicated?
          !syndication_sources.empty?
        end

        def syndicated_to
          syndication_sources.map do |source, url|
            {
              location: source,
              url: url
            }
          end
        end

        def photos?
          __getobj__.photos.count { |p| !p["value"].end_with?("mp4") } > 0
        end

        def photos
          __getobj__.photos.select { |p| !p["value"].end_with?("mp4") }
        end

        def videos?
          __getobj__.photos.count { |p| p["value"].end_with?("mp4") } > 0
        end

        def videos
          __getobj__.photos.select { |p| p["value"].end_with?("mp4") }
        end

        def prefix_emoji
          name ? "" : "💬"
        end

        def display_title
          title = name
          "#{prefix_emoji} #{title}"
        end

        def display_published_at
          published_at.strftime("%e %B, %Y")
        end

        def machine_published_at
          published_at.rfc2822
        end

        def feed_content
          photos? ? "<div>#{photos.map { |p| "<img src='#{p["value"]}'/>" }.join("")} #{content}</div>" : content
        end

        def raw_content
          Sanitize.fragment(content)
        end

        def excerpt
          truncate_html(content, 140, true)
        end

        def permalink
          "#{Hanami.app.settings.micropub_site_url}/post/#{slug}"
        end

        def lat
          geo[0]
        end

        def lon
          geo[1]
        end

        def small_map
          "https://api.mapbox.com/styles/v1/dnitza/cleb2o734000k01pbifls5620/static/pin-s+555555(#{lon},#{lat})/#{lon},#{lat},14,0/200x100@2x?access_token=pk.eyJ1IjoiZG5pdHphIiwiYSI6ImNsZWIzOHFmazBkODIzdm9kZHgxdDF4ajQifQ.mSneE-1SKeju8AOz5gp4BQ"
        end

        def large_map
          "https://api.mapbox.com/styles/v1/dnitza/cleb2o734000k01pbifls5620/static/pin-s+555555(#{lon},#{lat})/#{lon},#{lat},14,0/620x310@2x?access_token=pk.eyJ1IjoiZG5pdHphIiwiYSI6ImNsZWIzOHFmazBkODIzdm9kZHgxdDF4ajQifQ.mSneE-1SKeju8AOz5gp4BQ"
        end

        def template_type
          :post
        end

        private

        # e.g. geo:-37.75188,144.90417;u=35
        def geo
          loc = location.split(":")[1]
          p = loc.split(";")[0]

          p.split(",")
        end

        def truncate_html(content, len = 30, at_end = nil)
          return content if content.to_s.length <= len

          p = REXML::Parsers::PullParser.new(content)
          tags = []
          new_len = len
          results = ""
          while p.has_next? && new_len > 0
            p_e = p.pull
            case p_e.event_type
            when :start_element
              tags.push p_e[0]
              results << "<#{tags.last}#{attrs_to_s(p_e[1])}>"
            when :end_element
              results << "</#{tags.pop}>"
            when :text
              results << p_e[0][0..new_len]
              new_len -= p_e[0].length
            else
              results << "<!-- #{p_e.inspect} -->"
            end
          end
          if at_end
            results << "..."
          end
          tags.reverse_each do |tag|
            results << "</#{tag}>"
          end
          results
        end

        def attrs_to_s(attrs)
          if attrs.empty?
            ""
          else
            " " + attrs.to_a.map { |attr| %(#{attr[0]}="#{attr[1]}") }.join(" ")
          end
        end
      end
    end
  end
end
