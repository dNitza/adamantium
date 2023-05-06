module Admin
  module Actions
    module AutoTagging
      class New < Action

        include Deps[new_view: "views.auto_tagging.new"]

        def handle(req, res)
          res.render new_view
        end
      end
    end
  end
end