# frozen_string_literal: true

require "hanami/middleware/body_parser"

module Adamantium
  class Routes < Hanami::Routes
    use Hanami::Middleware::BodyParser, [:form, :json]

    slice :main, at: "/"
    slice :admin, at: "/admin"
    slice :micropub, at: "/micropub"
  end
end
