# frozen_string_literal: true

module Admin
  module Actions
    module Books
      class Update < Admin::Action
        include Deps["repos.book_repo"]

        def handle(req, resp)
          book_repo.update(req.params[:id], book_status: req.params[:book_status])
          resp.status = 204
        end
      end
    end
  end
end
