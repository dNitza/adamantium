module Adamantium
  module Actions
    module RecentlyPlayed
      class Index < Action
        include Deps["views.recently_played.index"]
        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
