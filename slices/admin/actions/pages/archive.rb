module Admin
  module Actions
    module Pages
      class Archive < Action
        include Deps["repos.page_repo"]

        def handle(req, res)
          page_repo.archive(slug: req.params[:slug])
        end
      end
    end
  end
end
