require "digest"
require "dry/monads"
require "httparty"

module Adamantium
  module Syndication
    class Mastodon
      include Dry::Monads[:result]
      include Deps["settings"]

      def call(post:)
        return Failure(:no_mastodon_credentials) unless settings.mastodon_token && settings.mastodon_server

        text = post.name
        text_with_link = "#{text} — #{settings.micropub_site_url}"
        tags = post.category.map { |tag| "##{tag}" }.join(" ")
        text_with_tags = "#{text_with_link} #{tags}"

        key = Digest::MD5.hexdigest text_with_tags
        mastodon_token = settings.mastodon_token
        mastodon_server = settings.mastodon_server.split("@").first

        response = HTTParty.post(mastodon_server, {
          headers: {
            "Idempotency-Key": key,
            Authorization: "Bearer #{mastodon_token}"
          },
          body: {
            status: text_with_tags
          }
        })

        if response.code > 200
          status = response.message
          Success("#{mastodon_server}/#{status[:id]}")
        else
          Failure(response.message)
        end
      end
    end
  end
end
