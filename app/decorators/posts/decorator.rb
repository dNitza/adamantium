# frozen_string_literal: false

# auto_register: false

require "rexml/parsers/pullparser"

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

        def prefix_emoji
          name ? "📝" : "📯"
        end

        def display_title
          title = name || published_at.strftime("%D")
          "#{prefix_emoji} #{title}"
        end

        def display_published_at
          published_at.strftime("%e %B, %Y")
        end

        def machine_published_at
          published_at.rfc2822
        end

        def excerpt
          truncate_html(content, 140, true)
        end

        private

        def truncate_html(content, len = 30, at_end = nil)
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
