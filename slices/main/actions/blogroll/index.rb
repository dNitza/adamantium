require "time_math"

module Main
  module Actions
    module Blogroll
      class Index < Action
        include Deps["views.blogroll.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
