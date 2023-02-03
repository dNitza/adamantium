module Adamantium
  module Commands
    module Posts
      class Update < Command
        include Deps["repos.post_repo", "renderers.markdown"]

        def call(params:)
          slug = URI(params[:url]).path.split("/").last
          post = post_repo.fetch!(slug)

          if params.key? :replace
            post_repo.update(post.id, {content: markdown.call(content: params[:replace][:content].first)})
          end

          if params.key? :add

          end

          if params.key? :delete

          end
        end
      end
    end
  end
end
