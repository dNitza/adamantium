# auto_register: false
# frozen_string_literal: true

module Main
  class Action < Adamantium::Action
    before :default_headers

    private

    def default_headers(_, res)
      res.headers["Strict-Transport-Security"] = "max-age=3600"
      res.headers["Referrer-Policy"] = "origin"
      res.headers["Permissions-Policy"] = "microphone=(), geolocation=()"
    end
  end
end
