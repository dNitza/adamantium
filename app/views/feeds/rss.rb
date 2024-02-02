require "builder"

module Adamantium
  module Views
    module Feeds
      class Rss < Adamantium::View
        include Deps["repos.post_repo"]

        expose :posts do
          post_repo.for_rss.map do |post|
            (post.post_type == "bookmark") ?
              Decorators::Bookmarks::Decorator.new(post) :
              Decorators::Posts::Decorator.new(post)
          end
        end

        expose :xml, decorate: false

        def xml
          Builder::XmlMarkup.new(indent: 2)
        end
      end
    end
  end
end
