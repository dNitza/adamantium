# frozen_string_literal: true

module Admin
  module Actions
    module Posts
      class DeSyndicate < Admin::Action
        include Deps["commands.posts.de_syndicate"]

        def handle(req, res)
          de_syndicate.call(post_id: req.params[:id], target: req.params[:target])
        end
      end
    end
  end
end
