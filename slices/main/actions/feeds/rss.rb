module Main
  module Actions
    module Feeds
      class Rss < Action
        include Deps["views.feeds.rss"]

        def handle(req, res)
          res.content_type = "text/xml; charset=utf-8"
          res.render rss, format: :xml
        end
      end
    end
  end
end
