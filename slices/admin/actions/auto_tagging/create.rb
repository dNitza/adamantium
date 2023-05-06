module Admin
  module Actions
    module AutoTagging
      class Create < Action

        include Deps["commands.auto_tagging.create",
                     "views.auto_tagging.index",
                     auto_tag: "commands.auto_tagging.tag"]

        def handle(req, res)
          title_contains = req.params[:title_contains]
          body_contains = req.params[:body_contains]
          tag_id = req.params[:tag_id]

          result = create.(title_contains: title_contains,
                  body_contains: body_contains,
                  tag_id: tag_id)

          if result.success?
            auto_tag.(auto_tag_id: result.value!)
          end

          res.render index
        end
      end
    end
  end
end