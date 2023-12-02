# frozen_string_literal: true

require "hanami/boot"

use Rack::Static, urls: ["/assets", "/media"], root: "public"

raise StandardError.new("No secret key") unless ENV["SESSION_SECRET"]

use Rack::Session::Cookie,
  domain: URI.parse(ENV["MICROPUB_SITE_URL"]).host,
  path: "/",
  expire_after: 3600 * 24,
  secret: ENV["SESSION_SECRET"]

require "rack/rewrite"
use Rack::Rewrite do
  # remove trailing slashes
  r302 %r{(/.*)/(\?.*)?$}, "$1$2"
end

run Hanami.app
