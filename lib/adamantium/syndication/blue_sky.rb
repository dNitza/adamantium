require "dry/monads"

module Adamantium
  module Syndication
    class BlueSky
      include Dry::Monads[:result]
      include Deps[blue_sky_client: "clients.blue_sky"]

      def call(post:)
        response = blue_sky.create_post(post: post)

        if response.success?
          Success(response.value!)
        else
          Failure(:failed_to_syndicate)
        end
      end
    end
  end
end
