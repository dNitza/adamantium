require "time_math"

module Main
  module Actions
    module Blogroll
      class List < Action
        include Deps["views.blogroll.list"]

        def handle(req, res)
          res.body = cache(key: "blogroll", content_proc: -> { list.call.to_str }, expiry: TimeMath.min.advance(Time.now, +60))
        end
      end
    end
  end
end
