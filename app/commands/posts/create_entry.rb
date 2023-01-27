module Adamantium
  module Commands
    module Posts
      class CreateEntry < Command
        include Deps["repos.post_repo",
          "post_utilities.slugify",
          renderer: "renderers.markdown"
                    ]
        def call(post)
          attrs = post.to_h
          attrs[:content] = renderer.call(content: attrs[:content])

          post_repo.create(attrs)
        end
      end
    end
  end
end
