require "dry/monads"
require "dry/monads/do"

module Adamantium
  module Commands
    module Posts
      class Syndicate
        include Dry::Monads[:result]
        include Dry::Monads::Do.for(:call)

        include Deps["settings",
          "syndication.mastodon",
          "syndication.pinboard"
        ]

        def call(post)
          syndicate_to = syndication_targets(post[:syndicate_to])
          if syndicate_to.include? :mastodon
            url = yield mastodon.call(post: post)

            Success([:mastodon, url])
          end

          if syndicate_to.include? :pinboard
            url = yield pinboard.call(post: post)

            Success([:pinboard, url])
          end

          Failure(:no_syndication_targets)
        end

        private

        def syndication_targets(syndicate_to)
          targets = []
          targets << :mastodon if syndicate_to.any? { |url| settings.mastodon_server.match(/#{url}/) }
          targets << :pinboard if syndicate_to.any? { |url| "https://pinboard.in".match(/#{url}/) }
          targets
        end
      end
    end
  end
end
