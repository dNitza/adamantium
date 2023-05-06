module Admin
  module Actions
    module AutoTagging
      class Delete < Action

        include Deps["repos.auto_tagging_repo"]

        def handle(req, res)
          auto_tagging_repo.delete(id: req.params[:id])
        end
      end
    end
  end
end