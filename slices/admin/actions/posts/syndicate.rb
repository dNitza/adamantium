# frozen_string_literal: true

module Admin
  module Actions
    module Posts
      class Syndicate < Admin::Action
        include Deps["commands.posts.syndicate"]

        def handle(req, res)
          syndicate.(post_id: req.params[:id], target: req.params[:target])
        end
      end
    end
  end
end
