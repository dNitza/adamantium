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
    setting :github_url, default: nil
    setting :mastodon_url, default: nil

    setting :webmention_url, default: nil
    setting :pingback_url, default: nil
    setting :webmention_token, default: nil

    setting :lastfm_api_key, default: nil
    setting :lastfm_secret, default: nil

    # Micropub endpoints
    setting :micropub_media_endpoint, default: "", constructor: Types::Params::String

    setting :micropub_authorization_endpoint
    setting :micropub_token_endpoint

    setting :mastodon_token, default: nil
    setting :mastodon_server, default: nil

    setting :pinboard_api_key, default: nil
  end
end
