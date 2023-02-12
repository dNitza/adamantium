require "dry/monads"

module Adamantium
  module Commands
    module Posts
      class CreateBookmark < Command
        include Deps["repos.post_repo", syndicate: "commands.posts.syndicate"]

        include Dry::Monads[:result]

        def call(bookmark)
          created_bookmark = post_repo.create(bookmark)

          syndicate.call(bookmark).bind do |result|
            source, url = result
            add_post_syndication_source.call(created_bookmark.id, source, url)
          end

          Success(created_bookmark)
        end
      end
    end
  end
end
