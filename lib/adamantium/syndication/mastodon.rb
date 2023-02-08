require "dry/monads"
require "httparty"

module Adamantium
  module Syndication
    class Mastodon
      include Dry::Monads[:result]
      include Deps[mastodon_client: "clients.mastodon"]

      def call(post:)
        media_ids = post[:photos]&.map do |photo|
          mastodon_client.upload_media(photo: photo)
        end&.compact

        response = mastodon_client.create_post(post: post, media_ids: media_ids)

        if response.success?
          Success(response.value!)
        else
          Failure(:failed_to_syndicate)
        end
      end
    end
  end
end
