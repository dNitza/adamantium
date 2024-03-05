require "dry/monads"
require "sanitize"

module Adamantium
  module Syndication
    class Gist
      include Dry::Monads[:result]
      include Deps[gist_client: "clients.gist"]

      def call(post:)
        description = ""
        public = true
        files = {
          post[:name] => {content: Sanitize.fragment(post[:content])}
        }

        gist_client.create_gist(description: description,
          public: public,
          files: files)
      end
    end
  end
end
