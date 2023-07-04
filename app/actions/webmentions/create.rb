# frozen_string_literal: true

module Adamantium
  module Actions
    module Webmentions
      class Create < Adamantium::Action

        include Deps["repos.webmentions_repo", "repos.post_repo"]

        def handle(req, res)
          req.params[:children].each do |child|
            if child[:"wm-property"] == "in-reply-to"

              slug = child[:"in-reply-to"].split("/").last
              post = post_repo.fetch!(slug)

              attrs = {
                type: "reply",
                author_name: child[:author][:name],
                author_photo: child[:author][:photo],
                author_url: child[:author][:url],
                published_at: child[:published],
                content_html: child[:content][:html],
                content_text: child[:content][:text],
                source_url: child[:url],
                target_url: child[:"in-reply-to"],
                post_id: post.id
              }

              webmentions_repo.create(attrs)
            end
          end
        end
      end
    end
  end
end
