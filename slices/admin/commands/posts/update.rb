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

          post_repo.update(params[:id], attrs_to_replace)
        end
      end
    end
  end
end
