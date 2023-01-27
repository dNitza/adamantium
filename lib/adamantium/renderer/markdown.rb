require "redcarpet"

module Adamantium
  module Renderer
    class Markdown
      attr_accessor :markdown

      def initialize
        renderer = Redcarpet::Render::HTML.new({})
        extensions = {
          fenced_code_blocks: true
        }
        @markdown = Redcarpet::Markdown.new(renderer, extensions)
      end

      def call(content:)
        markdown.render(content)
      end
    end
  end
end
