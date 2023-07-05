# frozen_string_literal: true

module Adamantium
  module Actions
    module Webmentions
      class Create < Adamantium::Action

        include Deps["repos.webmentions_repo", "repos.post_repo"]

        def handle(req, res)
          if req.params[:"wm-property"] == "in-reply-to"

            slug = req.params[:"in-reply-to"].split("/").last
            post = post_repo.fetch!(slug)

            attrs = {
              type: "reply",
              author_name: req.params[:author][:name],
              author_photo: req.params[:author][:photo],
              author_url: req.params[:author][:url],
              published_at: req.params[:published],
              content_html: req.params[:content][:html],
              content_text: req.params[:content][:text],
              source_url: req.params[:url],
              target_url: req.params[:"in-reply-to"],
              post_id: post.id
            }

            webmentions_repo.create(attrs)
          end
        end
      end
    end
  end
end
