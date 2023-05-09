# frozen_string_literal: true

module Admin
  module Actions
    module Trips
      class AddPost < Admin::Action

        include Deps["commands.trips.add_post"]

        def handle(req, res)
          add_post.call(post_id: req.params[:post_id], trip_id: req.params[:trip_id])
        end
      end
    end
  end
end
