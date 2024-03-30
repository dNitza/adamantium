require "digest/sha1"

module Main
  module Actions
    module Posts
      class React < Action

        include Deps["repos.reaction_repo", "repos.post_repo"]

        def handle(req, res)
          post = post_repo.fetch!(req.params[:slug])

          reaction_repo.create(post_id: post.id, visitor_identifier: Digest::SHA1.hexdigest(req.ip))

          reaction_count = reaction_repo.count(post_id: post.id)

          res.body = "👍 #{reaction_count}"
          res.status = 201

        rescue
          res.status = 400
        end
      end
    end
  end
end
