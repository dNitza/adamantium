# frozen_string_literal: true

require "hanami/middleware/body_parser"

module Micropub
  class Routes < Hanami::Routes
    use Hanami::Middleware::BodyParser, [:form, :json]

    get "/", to: "site.config"
    post "/", to: "posts.handle"
    post "/media", to: "media.create"
    get "/media", to: "media.show"

    post "/webmentions", to: "webmentions.create"
  end
end
