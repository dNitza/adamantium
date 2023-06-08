module Admin
  module Actions
    module MergeTags
      class Index < Action
        include Deps["views.merge_tags.index"]

        def handle(req, res)
          res.render index
        end
      end
    end
  end
end
