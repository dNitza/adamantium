require "readability"
require "down"

module Admin
  module Commands
    module Posts
      class Syndicate
        include Dry::Monads[:result]
        include Deps["repos.post_repo", "syndication.dayone"]

        def call(post_id:, target:)
          post = post_repo.find(id: post_id)

          dayone.(name: post[:name], content: post[:content]) if target.to_sym == :day_one
          Success()
        end
      end
    end
  end
end
