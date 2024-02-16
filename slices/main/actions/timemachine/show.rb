module Main
  module Actions
    module Timemachine
      class Show < Action
        include Deps["views.timemachine.show"]

        def handle(req, res)
          year, month, day = [
            req.params[:year],
            req.params[:month],
            req.params[:day]
          ]

          res.render show, year: year, month: month, day: day
        end
      end
    end
  end
end
