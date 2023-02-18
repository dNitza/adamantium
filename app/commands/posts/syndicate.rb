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
          syndicated_to = []
          if syndicate_to.include? :mastodon
            res = mastodon.call(post: post)

            syndicated_to << [:mastodon, res.value!] if res.success?
          end

          if syndicate_to.include? :pinboard
            res = pinboard.call(post: post)

            syndicated_to << [:pinboard, res.value!] if res.success?
          end

          return Success(syndicated_to) unless syndicated_to.empty?

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
