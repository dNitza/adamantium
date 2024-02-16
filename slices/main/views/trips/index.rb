module Main
  module Views
    module Trips
      class Index< Main::View
        include Deps["repos.trip_repo"]

        expose :trip_years do
          trip_repo
            .list
            .group_by { |trip| trip.start_date.year }
        end
      end
    end
  end
end
