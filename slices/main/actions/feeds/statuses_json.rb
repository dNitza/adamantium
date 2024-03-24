module Main
  module Actions
    module Feeds
      class StatusesJSON < Action
        include Deps["views.feeds.statuses_json", "repos.post_repo"]

        def handle(req, res)
          posts = post_repo.statuses_for_rss.map do |post|
            Decorators::Posts::Decorator.new(post).to_h
          end

          res.content_type = "application/json; charset=utf-8"
          res.body = JSON.generate(posts, quirks_mode: true)
        end
      end
    end
  end
end
