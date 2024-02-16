# auto_register: false
# frozen_string_literal: true

require "hanami/view"

module Main
  class View < Hanami::View
    config.default_context = Adamantium::Context.new
    config.layouts_dir = "layouts"
    config.layout = "app"
    config.paths = "slices/main/templates"
  end
end
