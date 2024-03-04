# frozen_string_literal: false

# auto_register: false

require "rexml/parsers/pullparser"
require "sanitize"
require "nokogiri"

module Main
  module Decorators
    module Statuses
      class Decorator < Main::Decorators::Posts::Decorator
        def raw_content
          Sanitize.fragment(content,
            elements: ["img", "p"],
            attributes: {"img" => ["alt", "src", "title"]})
        end
      end
    end
  end
end
