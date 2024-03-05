require "httparty"

module Adamantium
  module Client
    class Gist
      include Dry::Monads[:result]

      def initialize(token:)
        @token = token
      end

      def create_gist(description:, public:, files: {})
        request_body = {
          description: description,
          public: public,
          files: files
        }

        res = HTTParty.post("https://api.github.com/gists",
          body: JSON.generate(request_body),
          headers: {Authorization: "Bearer #{@token}"})

        if res.code >= 200 && res.code < 400
          Success(res["html_url"])
        else
          Failure(:could_not_save_gist)
        end
      end
    end
  end
end
