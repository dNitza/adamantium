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
    setting :fed_bridge_url, default: nil

    setting :webmention_url, default: nil
    setting :pingback_url, default: nil
    setting :webmention_token, default: nil

    setting :lastfm_api_key, default: nil
    setting :lastfm_secret, default: nil

    setting :apple_music_team, default: nil
    setting :apple_music_key, default: nil
    setting :apple_music_user_token, default: nil

    setting :omdb_api_key, default: nil

    setting :shortcut_key, default: nil

    setting :from_email, default: nil
    setting :dayone_email, default: nil

    setting :smtp_password, default: nil
    setting :smtp_username, default: nil
    # Micropub endpoints
    setting :micropub_media_endpoint, default: "", constructor: Types::Params::String

    setting :micropub_authorization_endpoint
    setting :micropub_token_endpoint

    setting :mastodon_token, default: nil
    setting :mastodon_server, default: nil

    setting :raindrop_api_key, default: nil

    setting :basic_auth_username, default: nil
    setting :basic_auth_password, default: nil

    setting :sentry_dsn, default: nil
    setting :raise_exceptions, default: true
  end
end
