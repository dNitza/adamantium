require "builder"

module Main
  module Views
    module Feeds
      class StatusesRss< Main::View
        include Deps["repos.post_repo"]

        expose :posts do
          post_repo.statuses_for_rss.map do |post|
            Decorators::Posts::Decorator.new post
          end
        end

        expose :xml, decorate: false, layout: true

        def xml
          Builder::XmlMarkup.new(indent: 2)
        end
      end
    end
  end
end
