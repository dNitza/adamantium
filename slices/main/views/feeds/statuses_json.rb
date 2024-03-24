require "builder"

module Main
  module Views
    module Feeds
      class StatusesJSON < Main::View
        include Deps["repos.post_repo"]

        expose :posts do
          post_repo.statuses_for_rss.map do |post|
            Decorators::Posts::Decorator.new post
          end
        end

        expose :json, decorate: false, layout: true do |posts|
          posts.to_json
        end
      end
    end
  end
end
