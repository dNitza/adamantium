module Admin
  module Actions
    module AutoTagging
      class Create < Action

        include Deps["commands.auto_tagging.create",
                     "views.auto_tagging.index",
                     "validation.contracts.auto_tagging_contract",
                     auto_tag: "commands.auto_tagging.tag",
                     new_view: "views.auto_tagging.new"]

        def handle(req, res)
          title_contains = req.params[:title_contains]
          body_contains = req.params[:body_contains]
          tag_id = req.params[:tag_id]
          tag_now = req.params[:tag_now]

          validation = auto_tagging_contract.call(title_contains: title_contains,
                                     body_contains: body_contains,
                                     tag_id: tag_id)

          if validation.success?
            result = create.(title_contains: title_contains,
                    body_contains: body_contains,
                    tag_id: tag_id)

            if result.success? && tag_now
              auto_tag.(auto_tag_id: result.value!)
            end

            res.render index
          end

          res.render new_view, errors: validation.errors
        end
      end
    end
  end
end