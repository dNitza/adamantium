# auto_register: false
# frozen_string_literal: true

require "hanami/action"
require "httparty"
require "dry-monads"
require "dry-matcher"
require "dry/matcher/result_matcher"
require "time_math"

module Adamantium
  class Action < Hanami::Action
    include Deps["logger",
      "settings",
      "view_cache.cacher",
      not_found_view: "views.not_found",
      error_view: "views.error"]

    include Dry::Matcher.for(:handle, with: Dry::Matcher::ResultMatcher)
    include Dry::Monads[:result]

    handle_exception ROM::TupleCountMismatchError => :not_found
    handle_exception StandardError => :handle_error

    def cache(key:, content_proc:, params: [], expiry: TimeMath.min.advance(Time.now, +10))
      cacher.call(key: key, params: params, content_proc: content_proc, expiry: expiry)
    end

    def not_found(_req, res, _exception)
      res.status = 404
      res.render not_found_view
    end

    def handle_error(req, res, exception)
      raise exception if settings.raise_exceptions

      res.status = 500
      res.render error_view
      res.headers["Cache-Control"] = "no-store, max-age=0"
    end
  end
end
