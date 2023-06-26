module Adamantium
  module Views
    module Books
      class Index < Adamantium::View
        include Deps["repos.post_repo"]

        expose :books do
          post_repo.books_listing.map do |book|
            Decorators::Books::Decorator.new book
          end
        end
      end
    end
  end
end
