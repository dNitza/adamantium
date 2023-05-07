# frozen_string_literal: true

require "hanami"

module Adamantium
  class App < Hanami::App
    config.actions.content_security_policy[:script_src] += " 'unsafe-eval' https://gist.github.com"
    config.actions.content_security_policy[:script_src] += " *.dnitza.com"
    config.actions.content_security_policy[:script_src] += " https://api.mapbox.com/mapbox-gl-js/v2.9.1/mapbox-gl.js"
    config.actions.content_security_policy[:media_src] += " https://dnitza.com"
    config.actions.content_security_policy[:script_src] += " https://unpkg.com/htmx.org@1.8.4 https://unpkg.com/htmx.org@1.9.2"
    config.actions.content_security_policy[:script_src] += " https://cdn.jsdelivr.net/npm/alpinejs@3.12.0/dist/cdn.min.js"
    config.actions.content_security_policy[:connect_src] += " https://stats.dnitza.com/api/event https://*.mapbox.com"
    config.actions.content_security_policy[:frame_src] += " https://embed.music.apple.com"
    config.actions.content_security_policy[:style_src] += " https://api.mapbox.com/mapbox-gl-js/v2.9.1/mapbox-gl.css"
    config.actions.content_security_policy[:child_src] = " blob:"

    config.logger.level = :debug
    config.logger.stream = "log/hanami.log"
  end
end
