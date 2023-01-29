module Adamantium
  module Commands
    module Posts
      class Syndicate
        include Deps["settings", "syndication.mastodon"]

        def call(post)
          if post[:syndicate_to].any? { |url| settings.mastodon_server.match(/#{url}/) }
            mastodon.call(post: post)
          end
        end
      end
    end
  end
end
