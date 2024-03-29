# frozen_string_literal: false

# auto_register: false

require "rexml/parsers/pullparser"
require "sanitize"
require "nokogiri"

module Admin
  module Decorators
    module Statuses
      class Decorator < Main::Decorators::Posts::Decorator
        def raw_content
          res = Sanitize.fragment(content,
            elements: ["img", "p"],
            attributes: {"img" => ["alt", "src", "title"]})

          res.gsub(prefix_emoji[0], "") if prefix_emoji
        end
      end
    end
  end
end
