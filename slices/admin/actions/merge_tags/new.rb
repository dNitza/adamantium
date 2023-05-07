module Admin
  module Actions
    module MergeTags
      class New < Action

        include Deps[new_view: "views.merge_tags.new"]

        def handle(req, res)
          res.render new_view, id: req.params[:id]
        end
      end
    end
  end
end