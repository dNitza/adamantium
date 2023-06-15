# frozen_string_literal: true

module Admin
  module Actions
    module Trips
      class RemovePost < Admin::Action
        include Deps["commands.trips.remove_post"]

        def handle(req, res)
          remove_post.call(post_id: req.params[:post_id], trip_id: req.params[:trip_id])
        end
      end
    end
  end
end
