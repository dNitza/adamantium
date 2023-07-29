require "dry/monads"

module Adamantium
  module Commands
    module Posts
      class CreateBookmark < Command
        include Deps["repos.post_repo",
          "post_utilities.page_cacher",
          syndicate: "commands.posts.syndicate",
          raindrop: "syndication.raindrop",
        ]

        include Dry::Monads[:result]

        def call(bookmark)
          created_bookmark = post_repo.create(bookmark)

          syndicate.call(created_bookmark.id, bookmark)
          raindrop.call(post: created_bookmark)

          if bookmark[:cache]
            page_cacher.call(url: created_bookmark.url) do |content|
              post_repo.update(id: created_bookmark.id, cached_content: content)
            end
          end

          Success(created_bookmark)
        end
      end
    end
  end
end
