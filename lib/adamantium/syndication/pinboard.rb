require "pinboard"
require "dry/monads"

module Adamantium
  module Syndication
    class Pinboard
      attr_reader :pinboard
      include Dry::Monads[:result]

      def initialize(api_key:)
        @pinboard = ::Pinboard::Client.new(token: api_key)
      end

      def call(post:)
        if pinboard.add(url: post[:url], description: post[:content]) == "done"
          href = pinboard.get(url: post[:url]).href
          Success(href)
        else
          Failure(:failed_to_post_to_pinboard)
        end
      end
    end
  end
end
