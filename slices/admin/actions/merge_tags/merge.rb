module Admin
  module Actions
    module MergeTags
      class Merge < Action
        include Deps["commands.merge_tags.merge"]

        def handle(req, res)
          target_id = req.params[:target_id]
          source_id = req.params[:source_id]

          result = merge.call(target_id: target_id, source_id: source_id)

          if result.success?
            res.redirect_to "/admin/tags/merge"
            res.status 200
          else
            res.status 500
          end
        end
      end
    end
  end
end
