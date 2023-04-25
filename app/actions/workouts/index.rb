module Adamantium
  module Actions
    module Workouts
      class Index < Action
        include Deps["views.workouts.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
