module Main
  module Actions
    module Statuses
      class Index < Action
        include Deps["views.statuses.index"]
        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
