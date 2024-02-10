module Admin
  module Commands
    module Posts
      class Update
        include Deps[
          "repos.post_repo",
          "renderers.markdown"
                ]

        def call(params:)
          attrs_to_replace = {}
          attrs_to_replace[:content] = markdown.call(content: params[:body]) if params[:body]

          tags = params[:tags].split(",").map(&:strip)

          post_repo.update(params[:id], attrs_to_replace)
          if tags && !tags.empty?
            post_repo.remove_tags(post_id: params[:id])
            post_repo.tag_post(post_id: params[:id], tags: tags)
          end
        end
      end
    end
  end
end
