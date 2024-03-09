require "dry/monads"
require "httparty"
require "nokogiri"

module Adamantium
  module Syndication
    class Mastodon
      include Dry::Monads[:result]
      include Deps[mastodon_client: "clients.mastodon"]

      def call(post:)
        inline_images = inline_images(post[:content]).first(4).map { |img| {"value" => img, "alt" => ""} }
        images_to_upload = Array(inline_images) + Array(post[:photos])

        media_ids = images_to_upload.map do |photo|
          mastodon_client.upload_media(photo: photo)
        end.compact

        response = mastodon_client.create_post(post: post, media_ids: media_ids)

        if response.success?
          Success(response.value!)
        else
          Failure(:failed_to_syndicate)
        end
      end

      def de_syndicate(post_id:)
        response = mastodon_client.remove_post(post_id: post_id)

        if response.success?
          Success(response.value!)
        else
          Failure(:failed_to_de_syndicate)
        end
      end

      private

      def inline_images(content)
        doc = Nokogiri::HTML(content)
        doc.search("//img").flat_map { |img| img.attribute_nodes.flat_map(&:value) }
      end
    end
  end
end
