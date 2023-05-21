# auto_register: false
# frozen_string_literal: true

module Admin
  class Action < Adamantium::Action
    config.default_headers = {
      "Cache-Control" => "no-cache"
    }
  end
end
