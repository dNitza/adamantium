module Main
  module Actions
    module Books
      class Index < Action
        include Deps["views.books.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
