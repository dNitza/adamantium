# frozen_string_literal: true

require "hanami"

module Adamantium
  class App < Hanami::App
    config.actions.content_security_policy[:script_src] += " https://gist.github.com"
    config.actions.content_security_policy[:script_src] += " *.dnitza.com"
    config.actions.content_security_policy[:connect_src] += " https://stats.dnitza.com/api/event"

    config.logger.level = :debug
    config.logger.stream = "log/hanami.log"
  end
end
