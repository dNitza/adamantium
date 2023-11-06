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
          "syndication.blue_sky",
          add_post_syndication_source: "commands.posts.add_syndication_source",
          send_to_dayone: "syndication.dayone",
        ]

        def call(post_id, post)
          syndicate_to = syndication_targets(post[:syndicate_to])

          if syndicate_to.include? :mastodon
            res = mastodon.call(post: post)

            add_post_syndication_source.call(post_id, :mastodon, res.value!) if res.success?
          end

          if syndicate_to.include? :blue_sky
            res = blue_sky.call(post: post)

            add_post_syndication_source.call(post_id, :blue_sky, res.value!) if res.success?
          end

          if post[:category].include? "weekly"
            send_to_dayone.call(name: post[:name], content: post[:content])
          end

          Success()
        end

        private

        def syndication_targets(syndicate_to)
          targets = []
          targets << :mastodon if syndicate_to.any? { |url| settings.mastodon_server.match(/#{url}/) }
          targets << :blue_sky if syndicate_to.any? { |url| settings.blue_sky_url.match(/#{url}/) }
          targets
        end
      end
    end
  end
end
