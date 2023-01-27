module Adamantium
  module Commands
    module Posts
      class CreateBookmark < Command
        include Deps["repos.post_repo"]
        def call(bookmark)
          post_repo.create(bookmark)
        end
      end
    end
  end
end
