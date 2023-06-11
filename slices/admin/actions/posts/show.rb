# frozen_string_literal: true

module Admin
  module Actions
    module Posts
      class Show < Admin::Action
        include Deps["views.posts.show"]

        def handle(req, res)
          res.render show, id: req.params[:id]
        end
      end
    end
  end
end
