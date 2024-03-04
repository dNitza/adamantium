module Micropub
  module Commands
    module Posts
      class CreationResolver
        include Deps[
          "validation.posts.post_contract",
          "validation.posts.bookmark_contract",
          "validation.posts.checkin_contract",
          "validation.posts.book_contract",
          "validation.posts.code_contract",
          "commands.posts.create_post",
          "commands.posts.create_bookmark",
          "commands.posts.create_checkin",
          "commands.posts.create_book_post",
          "commands.posts.create_code_post"
               ]

        def call(entry_type:)
          case entry_type
          in Entities::BookmarkRequest
            {command: create_bookmark, validation: bookmark_contract}
          in Entities::CheckinRequest
            {command: create_checkin, validation: checkin_contract}
          in Entities::BookRequest
            {command: create_book_post, validation: book_contract}
          in Entities::CodeRequest
            {command: create_code_post, validation: code_contract}
          else
            {command: create_post, validation: post_contract}
          end
        end
      end
    end
  end
end
