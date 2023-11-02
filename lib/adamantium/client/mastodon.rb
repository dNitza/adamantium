require "httparty"
require "digest"
require "tempfile"
require "open-uri"
require "dry/monads"
require "sanitize"

module Adamantium
  module Client
    class Mastodon
      include Dry::Monads[:result]
      include Deps["settings"]

      def create_post(post:, media_ids:)
        unless settings.mastodon_token && settings.mastodon_server
          return Failure(:no_mastodon_credentials)
        end

        content = if post[:name]
          "#{post[:name]} — #{settings.micropub_site_url}/post/#{post[:slug]}"
        else
          "#{sanitze_post(post[:content])} \r\n\r\n 🔗 #{settings.micropub_site_url}/post/#{post[:slug]}"
        end

        tags = post[:category].map { |tag| "##{tag}" }.join(" ")
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
            status: text_with_tags,
            media_ids: media_ids.compact
          }
        })

        if response.code >= 200 && response.code < 300
          status = JSON.parse(response.body, symbolize_names: true)
          Success("#{settings.mastodon_server}/#{status[:id]}")
        else
          Failure(response.message)
        end
      end

      def upload_media(photo:)
        mastodon_server = settings.mastodon_server.split("@").first
        mastodon_token = settings.mastodon_token
        file = Tempfile.new(SecureRandom.uuid)

        # rubocop:disable Security/Open
        file.write(URI.open(photo["value"]).read)
        file.rewind
        # rubocop:enable Security/Open

        file_size = file.size.to_f / 2**20
        formatted_file_size = "%.2f" % file_size

        return if formatted_file_size > 2.0

        response = HTTParty.post("#{mastodon_server}api/v2/media", {
          headers: {
            Authorization: "Bearer #{mastodon_token}"
          },
          multipart: true,
          body: {
            file: file,
            description: photo["alt"]
          }
        })
        file.close
        file.unlink

        JSON.parse(response.body, symbolize_names: true).fetch(:id, nil)
      end

      private

      def sanitze_post(content)
        replace_links = lambda { |env|
          return unless env[:node_name] == "a"
          node = env[:node]
          url = node[:href]
          env[:node].replace(url)
        }

        Sanitize.fragment(content, transformers: [replace_links]).strip
      end
    end
  end
end
