require "dry/monads"

module Adamantium
  module Syndication
    class Raindrop
      attr_reader :api_key
      include Dry::Monads[:result]

      def initialize(api_key:)
        @api_key = api_key
      end

      def call(post:)
        uri = URI("https://api.raindrop.io/rest/v1/raindrop")

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        dict = {
          "title" => post[:name],
          "link" => post[:url]
        }
        body = JSON.dump(dict)
        req = Net::HTTP::Post.new(uri)
        req.add_field "Authorization", api_key
        req.add_field "Content-Type", "application/json; charset=utf-8"
        req.body = body

        response = nil

        begin
          response = http.request(req)
        rescue
          # NOOP
        end

        if response && response.code.to_s == "200"
          Success()
        else
          Failure(:failed_to_post_to_raindrop)
        end
      end
    end
  end
end
