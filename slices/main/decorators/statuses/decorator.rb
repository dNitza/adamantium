# frozen_string_literal: false

# auto_register: false

require "rexml/parsers/pullparser"
require "sanitize"
require "nokogiri"

module Main
  module Decorators
    module Statuses
      class Decorator < Main::Decorators::Posts::Decorator
        REGEXP = URI::DEFAULT_PARSER.make_regexp

        def raw_content
          html_text = wrap_anchors_in_object_tags(replace_urls_with_anchors(content))
          res = Sanitize.fragment(html_text,
            elements: ["img", "p", "object", "a"],
            attributes: {"img" => ["alt", "src", "title"], "a" => ["href"]})

          res.gsub(prefix_emoji[0], "") if prefix_emoji
        end

        private

        def replace_urls_with_anchors(text)
          url_regex = %r{(?<!<a href="|img src="|video src=")(https?://[^\s]+)(?![^<>]*(</a>|/>))}

          text.gsub(url_regex) do |url|
            %(<object><a href="#{url}">#{url}</a></object>)
          end
        end

        def wrap_anchors_in_object_tags(text)
          # Regular expression to match <a> tags
          anchor_regex = /(<a\s+[^>]*>.*?<\/a>)/

          # Replace the matched anchor tags with <object> wrapped anchor tags
          text.gsub(anchor_regex) do |anchor_tag|
            %(<object>#{anchor_tag}</object>)
          end
        end
      end
    end
  end
end
