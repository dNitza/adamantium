module Main
  module Views
    module Books
      class Index< Main::View
        include Deps["repos.post_repo"]

        private_expose :books do
          post_repo.books_listing.group_by { |book| book.book_status }
        end

        expose :read do |books|
          books["read"].map do |book|
            Decorators::Books::Decorator.new book
          end
        end

        expose :to_read do |books|
          books["to-read"].map do |book|
            Decorators::Books::Decorator.new book
          end
        end

        expose :reading do |books|
          books["reading"].map do |book|
            Decorators::Books::Decorator.new book
          end
        end
      end
    end
  end
end
