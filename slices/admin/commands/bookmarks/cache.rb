require "readability"
require "down"

module Admin
  module Commands
    module Bookmarks
      class Cache
        include Dry::Monads[:result]
        include Deps["repos.bookmark_repo"]

        def call(bookmark_id: )
          bookmark = bookmark_repo.fetch(id: bookmark_id)
          bookmark.url

          tempfile = Down.download(bookmark.url)
          content = Readability::Document.new(tempfile.read, tags: %w[div p h1 h2 h3 h4 h5 h6]).content

          bookmark_repo.update(id: bookmark_id, cached_content: content)

          Success()
        end
      end
    end
  end
end
