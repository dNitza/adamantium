module Adamantium
  module Commands
    module Posts
      class Syndicate
        include Deps["settings", "syndication.mastodon"]

        def call(post)
          if post[:syndicate_to].include? settings.mastodon_server
            mastodon.call(post: post)
          end
        end
      end
    end
  end
end
