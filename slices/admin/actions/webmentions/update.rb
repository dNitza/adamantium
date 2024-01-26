# frozen_string_literal: true

module Admin
  module Actions
    module Webmentions
      class Update < Admin::Action
        include Deps["repos.webmention_repo"]

        def handle(req, resp)
          update_type = req.params[:update_type]
          if update_type == "archive"
            webmention_repo.update(req.params[:id], published_at: nil)
          end

          if update_type == "publish"
            webmention_repo.update(req.params[:id], published_at: Time.now)
          end

          resp.headers["HX-Refresh"] = true
          resp.status = 200
        end
      end
    end
  end
end
