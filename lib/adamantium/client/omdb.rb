require "omdb/api"

module Adamantium
  module Client
    class Omdb
      def initialize(api_key:)
        @client = ::Omdb::Api::Client.new(api_key: api_key)
      end

      def call(imdb_id:)
        @client.find_by_id(imdb_id)
      rescue
        nil
      end
    end
  end
end
