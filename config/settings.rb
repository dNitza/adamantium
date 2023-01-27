# frozen_string_literal: true

require "adamantium/types"

module Adamantium
  class Settings < Hanami::Settings
    # Infrastructure
    setting :database_url

    # Site details
    setting :site_name

    ## ---- Micropub ----

    # Site details
    setting :micropub_site_id
    setting :micropub_site_name
    setting :micropub_site_url
    # Auth
    setting :micropub_pub_key, default: nil
    # TODO: add other auth methods here

    # Micropub endpoints
    setting :micropub_media_endpoint, default: "", constructor: Types::Params::String

    setting :micropub_authorization_endpoint
    setting :micropub_token_endpoint
  end
end
