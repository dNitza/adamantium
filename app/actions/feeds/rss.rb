module Adamantium
  module Actions
    module Feeds
      class Rss < Action
        include Deps["views.feeds.rss"]

        def handle(req, res)
          res.content_type = "application/rss+xml"
          res.render rss, format: :xml
        end
      end
    end
  end
end
