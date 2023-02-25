module Adamantium
  module Commands
    module Posts
      class CreationResolver
        include Deps[
          "validation.posts.post_contract",
          "validation.posts.bookmark_contract",
          "validation.posts.checkin_contract",
          "commands.posts.create_entry",
          "commands.posts.create_bookmark",
          "commands.posts.create_checkin"
               ]

        def call(entry_type:)
          case entry_type
          in Entities::BookmarkRequest
            {command: create_bookmark, validation: bookmark_contract}
          in Entities::CheckinRequest
            {command: create_checkin, validation: checkin_contract}
          else
            {command: create_entry, validation: post_contract}
          end
        end
      end
    end
  end
end
