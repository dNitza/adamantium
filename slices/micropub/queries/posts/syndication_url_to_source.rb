module Micropub
  module Queries
    module Posts
      class SyndicationUrlToSource
        def call(url:)
          if url.match("https://social.dnitza.com")
            return :mastodon
          end

          if url.match("https://bsky.social")
            return :bluesky
          end

          if url.match("https://gist.github.com")
            return :gist
          end
        end
      end
    end
  end
end
