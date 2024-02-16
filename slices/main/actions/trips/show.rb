# frozen_string_literal: true

module Main
  module Actions
    module Trips
      class Show < Adamantium::Action
        include Deps["views.trips.show"]

        def handle(req, res)
          res.render show, id: req.params[:id]
        end
      end
    end
  end
end
