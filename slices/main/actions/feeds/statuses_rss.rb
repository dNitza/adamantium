module Main
  module Actions
    module Feeds
      class StatusesRss < Action
        include Deps["views.feeds.statuses_rss"]

        def handle(req, res)
          res.content_type = "text/xml; charset=utf-8"
          res.render statuses_rss, format: :xml
        end
      end
    end
  end
end
