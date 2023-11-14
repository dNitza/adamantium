require "bskyrb"
require "digest"
require "tempfile"
require "open-uri"
require "dry/monads"
require "sanitize"

module Adamantium
  module Client
    class BlueSky
      include Dry::Monads[:result]
      include Deps["settings"]

      def create_post(post:)
        unless settings.blue_sky_username && settings.blue_sky_url
          return Failure(:no_blue_sky_credentials)
        end

        content = if post[:name]
          "#{post[:name]} — #{settings.micropub_site_url}/post/#{post[:slug]}"
        else
          "#{sanitze_post(post[:content])} \r\n\r\n 🔗 #{settings.micropub_site_url}/post/#{post[:slug]}"
        end

        credentials = Bskyrb::Credentials.new(settings.blue_sky_username, settings.blue_sky_password)
        session = Bskyrb::Session.new(credentials, settings.blue_sky_url)
        client = Bskyrb::RecordManager.new(session)

        response = client.create_post content

        if response["uri"] && response["uri"] != ""
          Success(response["uri"])
        else
          Failure(response.message)
        end
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
