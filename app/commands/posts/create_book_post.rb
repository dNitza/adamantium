require "dry/monads"

module Adamantium
  module Commands
    module Posts
      class CreateBookPost < Command
        include Deps["repos.post_repo"]

        include Dry::Monads[:result]

        def call(post)
          created_post = post_repo.create(post)

          Success(created_post)
        end
      end
    end
  end
end
