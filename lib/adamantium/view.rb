# auto_register: false
# frozen_string_literal: true

require "hanami/view"

module Adamantium
  class View < Hanami::View
    config.default_context = Adamantium::Context.new
  end
end
