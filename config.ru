# frozen_string_literal: true

require "hanami/boot"

use Rack::Static, urls: ["/assets", "/media"], root: "public"

run Hanami.app
