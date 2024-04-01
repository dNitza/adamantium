require "time_math"

module Main
  module Actions
    module PastWeek
      class Index < Action
        include Deps["views.past_week.index"]

        def handle(req, res)
          res.body = cache(key: "past_week", content_proc: -> { index.call.to_str })
        end
      end
    end
  end
end
