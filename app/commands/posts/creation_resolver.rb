module Adamantium
  module Commands
    module Posts
      class CreationResolver
        include Deps[
          "validation.posts.post_contract",
          "validation.posts.bookmark_contract",
          "commands.posts.create_entry",
          "commands.posts.create_bookmark"
               ]

        def call(entry_type:)
          case entry_type
          in Entities::BookmarkRequest
            {command: create_bookmark, validation: bookmark_contract}
          else
            {command: create_entry, validation: post_contract}
          end
        end
      end
    end
  end
end
