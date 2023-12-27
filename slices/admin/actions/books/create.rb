# frozen_string_literal: true

module Admin
  module Actions
    module Books
      class Create < Admin::Action
        include Deps["repos.book_repo"]

        def handle(req, resp)
          book_repo.create({
            name: req.params[:name],
            book_author: req.params[:book_author],
            slug: req.params[:slug],
            content: "",
            book_status: req.params[:book_status],
            post_type: "book",
            published_at: Time.now
          })

          resp.redirect_to "/admin/books"
        end
      end
    end
  end
end
