require "digest"
require "dry/monads"
require "httparty"

module Adamantium
  module Syndication
    class Mastodon
      include Dry::Monads[:result]
      include Deps["settings", "logger"]

      def call(post:)
        unless settings.mastodon_token && settings.mastodon_server
          logger.info("No Mastodon credentials")
          return Failure(:no_mastodon_credentials)
        end

        content = if post[:name]
          "#{post[:name]} — #{settings.micropub_site_url}/post/#{post[:slug]}"
        else
          post[:content]
        end

        text_with_tags = "#{content} #{tags}"

        key = Digest::MD5.hexdigest text_with_tags
        mastodon_token = settings.mastodon_token
        mastodon_server = settings.mastodon_server.split("@").first

        response = HTTParty.post("#{mastodon_server}api/v1/statuses", {
          headers: {
            "Idempotency-Key": key,
            Authorization: "Bearer #{mastodon_token}"
          },
          body: {
            status: text_with_tags
          }
        })

        if response.code >= 200 && response.code < 300
          status = JSON.parse(response.body, symbolize_names: true)
          Success("#{mastodon_server}/#{status[:id]}")
        else
          logger.info("Failed to syndicate to Mastodon: #{response.message}")
          Failure(response.message)
        end
      end
    end
  end
end
