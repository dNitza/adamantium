module Adamantium
  module Actions
    module More
      class Index < Action
        include Deps["views.more.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
