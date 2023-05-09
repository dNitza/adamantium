# frozen_string_literal: true

module Admin
  module Actions
    module Trips
      class Create < Admin::Action

        include Deps["commands.trips.create"]

        def handle(req, res)
          create.call(trip: req.params[:trip])
        end
      end
    end
  end
end
