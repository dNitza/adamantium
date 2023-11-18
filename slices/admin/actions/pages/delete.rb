module Admin
  module Actions
    module Pages
      class Delete < Action
        include Deps["repos.page_repo"]

        def handle(req, res)
          page_repo.delete(id: req.params[:slug])
        end
      end
    end
  end
end
