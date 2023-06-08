module Admin
  module Actions
    module AutoTagging
      class Index < Action
        include Deps["views.auto_tagging.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
