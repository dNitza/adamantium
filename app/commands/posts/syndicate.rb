require "dry/monads"
require "dry/monads/do"

module Adamantium
  module Commands
    module Posts
      class Syndicate
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Deps["settings", "syndication.mastodon"]

        def call(post)
          if post[:syndicate_to].any? { |url| settings.mastodon_server.match(/#{url}/) }
            url = yield mastodon.call(post: post)

            Success([:mastodon, url])
          end
        end
      end
    end
  end
end
