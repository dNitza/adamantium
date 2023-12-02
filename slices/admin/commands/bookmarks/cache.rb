module Admin
  module Commands
    module Bookmarks
      class Cache
        include Dry::Monads[:result]
        include Deps["repos.bookmark_repo", "post_utilities.page_cacher"]

        def call(bookmark_id:)
          bookmark = bookmark_repo.fetch(id: bookmark_id)

          page_cacher.call(url: bookmark.url) do |content|
            bookmark_repo.update(id: bookmark_id, params: {cached_content: content})
          end

          Success()
        end
      end
    end
  end
end
