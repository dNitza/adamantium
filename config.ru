# frozen_string_literal: true

require "hanami/boot"

use Rack::Static, urls: ["/assets", "/media", "/fonts"], root: "public", cascade: true

raise StandardError.new("No secret key") unless ENV["SESSION_SECRET"]

use Rack::Session::Cookie,
  domain: URI.parse(ENV["MICROPUB_SITE_URL"]).host,
  path: "/",
  expire_after: 3600 * 72,
  secret: ENV["SESSION_SECRET"]

require "rack/rewrite"
use Rack::Rewrite do
  # remove trailing slashes
  r302 %r{(/.*)/(\?.*)?$}, "$1$2"
  r302 %r{/fonts/(.*)?$}, lambda { |match, rack_env|
    manifest = JSON.parse(File.read("public/assets/main/assets.json"))

    manifest[match[1]]["url"]
  }
end

require "rack/attack"
use Rack::Attack

require "adamantium/middleware/header_fix"
use Adamantium::Middleware::HeaderFix do |headers, env|
  unless headers["Content-Type"]&.downcase&.include?("xml") || headers["Content-Type"]&.downcase&.include?("json")
    headers["Content-Type"] = "text/html; charset=utf-8"
  end
end

run Hanami.app
