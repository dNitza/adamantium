module Admin
  module Actions
    module Pages
      class Publish < Action
        include Deps["repos.page_repo"]

        def handle(req, res)
          page_repo.publish(slug: req.params[:slug])
        end
      end
    end
  end
end
