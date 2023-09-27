# frozen_string_literal: true

require "hanami"

module Adamantium
  class App < Hanami::App
    config.assets.manifest_path = "public/assets/asset-manifest.json"

    config.actions.content_security_policy[:script_src] += " 'unsafe-eval' https://gist.github.com"
    config.actions.content_security_policy[:script_src] += " *.dnitza.com"
    config.actions.content_security_policy[:script_src] += " https://api.mapbox.com/mapbox-gl-js/v2.9.1/mapbox-gl.js"
    config.actions.content_security_policy[:media_src] += " https://dnitza.com"
    config.actions.content_security_policy[:script_src] += " https://unpkg.com/htmx.org@1.9.2/dist/htmx.min.js "
    config.actions.content_security_policy[:script_src] += " https://cdn.jsdelivr.net/npm/alpinejs@3.12.0/dist/cdn.min.js"
    config.actions.content_security_policy[:script_src] += " https://unpkg.com/@highlightjs/cdn-assets@11.8.0/highlight.min.js"
    config.actions.content_security_policy[:connect_src] += " https://stats.dnitza.com/api/event https://*.mapbox.com"
    config.actions.content_security_policy[:frame_src] += " https://embed.music.apple.com https://www.youtube.com https://player.vimeo.com"
    config.actions.content_security_policy[:style_src] += " https://api.mapbox.com/mapbox-gl-js/v2.9.1/mapbox-gl.css"
    config.actions.content_security_policy[:style_src] += " https://unpkg.com/@highlightjs/cdn-assets@11.8.0/styles/github-dark.min.css"
    config.actions.content_security_policy[:child_src] = " blob:"

    config.logger.level = :info
    config.logger.stream = "log/hanami.log"

    config.shared_app_component_keys += [
      "syndication.dayone",
      "renderers.markdown",
      "post_utilities.link_finder"
    ]
  end
end
