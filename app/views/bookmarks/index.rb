module Adamantium
  module Views
    module Bookmarks
      class Index < Adamantium::View
        include Deps["repos.post_repo"]

        expose :bookmarks do |query:|
          post_repo.bookmark_listing(query: query).map do |bookmark|
            Decorators::Bookmarks::Decorator.new bookmark
          end
        end

        expose :q do |query:|
          query
        end
      end
    end
  end
end
