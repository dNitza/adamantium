require "readability"
require "down"

module Admin
  module Commands
    module Posts
      class DeSyndicate
        include Dry::Monads[:result]
        include Deps["repos.post_repo", "syndication.mastodon"]

        def call(post_id:, target:)
          post = post_repo.find(id: post_id)

          request = if target.to_sym == :mastodon
            masto_id = post.syndication_sources[target].split("/").last
            if masto_id == ""
              Success()
            else
              mastodon.de_syndicate(post_id: masto_id)
            end
          end

          if request.success?
            post.syndication_sources.delete(target)
            post_repo.update(post_id, post)
          end

          Success()
        end
      end
    end
  end
end
