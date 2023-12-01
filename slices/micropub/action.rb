# auto_register: false
# frozen_string_literal: true

module Micropub
  class Action < Adamantium::Action
    include Deps["logger",
                 "settings",
                 not_found_view: "views.not_found",
                 error_view: "views.error",
                 sentry: "sentry.client"]

    include Dry::Matcher.for(:handle, with: Dry::Matcher::ResultMatcher)
    include Dry::Monads[:result]

    handle_exception ROM::TupleCountMismatchError => :not_found
    handle_exception StandardError => :handle_error

    def authenticate!(req, res)
      halt 400 if req.env["HTTP_AUTHORIZATION"] && req.params[:access_token]

      if Hanami.env == :development || Hanami.env == :test
        req.env[:scopes] = verify_token(nil)
        return true
      end

      # Pull out and verify the authorization header or access_token

      if req.env["HTTP_AUTHORIZATION"]
        header = req.env["HTTP_AUTHORIZATION"].match(/Bearer (.*)$/)
        access_token = header[1] unless header.nil?
      elsif req.params["access_token"]
        access_token = req.params["access_token"]
      else
        logger.error "Received request without a token"
        halt 401
      end

      req.env[:access_token] = access_token

      # Verify the token and extract scopes
      req.env[:scopes] = verify_token(access_token)
    end

    def not_found(_req, res, _exception)
      res.status = 404
      res.render not_found_view
    end

    def handle_error(req, res, exception)
      raise exception if settings.raise_exceptions

      sentry.capture_exception(exception)

      res.status = 500
      res.render error_view
      res.headers["Cache-Control"] = "no-store, max-age=0"
    end

    def verify_scope(req:, scope:)
      req.env[:scopes].include? scope
    end

    private

    def verify_token(access_token)
      return %i[create update delete undelete media] if settings.shortcut_key == access_token
      return %i[create update delete undelete media] if Hanami.env == :development || Hanami.env == :test

      resp = HTTParty.get(settings.micropub_token_endpoint, {
        headers: {
          "Accept" => "application/x-www-form-urlencoded",
          "Authorization" => "Bearer #{access_token}"
        }
      })
      decoded_response = URI.decode_www_form(resp.body).to_h.transform_keys(&:to_sym)

      logger.info({log: "verify_response", msg: decoded_response.inspect, token: access_token})

      halt 401 unless (decoded_response.include? :scope) && (decoded_response.include? :me)

      decoded_response[:scope].gsub("post", "create").split.map(&:to_sym)
    end
  end
end
