module Admin
  module Actions
    module Sessions
      class New < Action
        include Deps["views.sessions.new"]

        def handle(req, res)
          res.render new
        end
      end
    end
  end
end
