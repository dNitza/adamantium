module Adamantium
  module Actions
    module Feeds
      class StatusesRss < Action
        include Deps["views.feeds.statuses_rss"]

        def handle(req, res)
          res.content_type = "application/rss+xml"
          res.render statuses_rss, format: :xml
        end
      end
    end
  end
end
