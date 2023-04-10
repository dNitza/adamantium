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
        if response.code == 200
          result = JSON.parse(response, symbolize_name: true)
          result[:item]
          Success(href)
        else
          Failure(:failed_to_post_to_pinboard)
        end
      end
    end
  end
end
