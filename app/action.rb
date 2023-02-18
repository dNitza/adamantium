# auto_register: false
# frozen_string_literal: true

require "hanami/action"
require "httparty"
require "dry-monads"
require "dry-matcher"
require "dry/matcher/result_matcher"

module Adamantium
  class Action < Hanami::Action
    include Deps["logger", "settings", not_found_view: "views.not_found"]

    include Dry::Matcher.for(:handle, with: Dry::Matcher::ResultMatcher)
    include Dry::Monads[:result]

    handle_exception ROM::TupleCountMismatchError => :not_found

    def authenticate!(req, res)
      if Hanami.env == :development || Hanami.env == :test
        req.env[:scopes] = verify_token(nil)
        return true
      end

      # Pull out and verify the authorization header or access_token

      halt 400 if req.env["HTTP_AUTHORIZATION"] && req.params["access_token"]

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

    def verify_scope(req:, scope:)
      req.env[:scopes].include? scope
    end

    private

    def verify_token(access_token)
      return %i[create update delete undelete media] if Hanami.env == :development || Hanami.env == :test

      resp = HTTParty.get(settings.micropub_token_endpoint, {
        headers: {
          "Accept" => "application/x-www-form-urlencoded",
          "Authorization" => "Bearer #{access_token}"
        }
      })
      decoded_response = URI.decode_www_form(resp.body).to_h.transform_keys(&:to_sym)

      halt 401 unless (decoded_response.include? :scope) && (decoded_response.include? :me)

      decoded_response[:scope].gsub(/post/, "create").split.map(&:to_sym)
    end
  end
end
