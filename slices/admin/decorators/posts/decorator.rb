# frozen_string_literal: false

# auto_register: false

require "rexml/parsers/pullparser"
require "sanitize"
require "nokogiri"
require "unicode/emoji"

module Admin
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

        def key_image
          if photos?
            return photos.first["url"]
          end

          inline_images.first[1] if inline_images
        end

        def inline_images
          doc = Nokogiri::HTML(content)
          doc.at("//img")
        end

        def inline_image_sources
          inline_images
            &.select { |attr, _value| attr == "src" }
            &.map { |img| img[1] } || []
        end

        def photo_sources
          photos.map { |photo| photo["value"] }
        end

        def prefix_emoji
          if name
            nil
          elsif photos? && content == ""
            "📷"
          elsif __getobj__.emoji
            __getobj__.emoji
          else
            @prefix_emoji ||= if (match = content.match(Unicode::Emoji::REGEX))
              match
            else
              "💬"
            end
          end
        end

        def display_title
          title = name
          if prefix_emoji
            return "#{prefix_emoji} #{title}"
          else
            return title
          end
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
          res = Sanitize.fragment(content)
          res.gsub(prefix_emoji[0], "") if prefix_emoji
        end

        def excerpt
          name ? truncate_html(content, 240, true) : content
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

        def posted_in
          if name.nil?
            :statuses
          elsif post_type.to_sym == :book
            :bookshelf
          elsif location.nil?
            :posts
          else
            :places
          end
        end

        def trips
          __getobj__.trips
        end

        def to_h
          clean_content = CGI.unescapeHTML(content.gsub(/<\/?[^>]*>/, "")).strip
          clean_content = clean_content.gsub(prefix_emoji[0], "") if prefix_emoji
          {
            id: slug,
            emoji: prefix_emoji,
            content: clean_content,
            images: (inline_image_sources + photo_sources).compact,
            published_at: display_published_at
          }
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
