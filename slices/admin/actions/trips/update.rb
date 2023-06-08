# frozen_string_literal: true

module Admin
  module Actions
    module Trips
      class Update < Admin::Action
        include Deps["commands.trips.update"]

        def handle(req, res)
          id = req.params[:id]
          trip = req.params[:trip]

          update.call(id: id, trip: trip)

          res.redirect_to "/admin/trips/#{id}"
        end
      end
    end
  end
end
