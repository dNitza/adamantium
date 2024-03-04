require "dry/monads"

module Micropub
  module Commands
    module Posts
      class CreateCodePost < Adamantium::Command
        include Deps["repos.post_repo",
          renderer: "renderers.markdown",
          syndicate: "commands.posts.syndicate",
                    ]

        include Dry::Monads[:result]

        def call(post)
          post_params = prepare_params(params: post)
          created_post = post_repo.create(post_params)

          # syndicate.call(created_post.id, post)

          # decorated_post = Decorators::Posts::Decorator.new(created_post)

          Success(created_post)
        end

        private

        def prepare_params(params:)
          attrs = params.to_h
          attrs[:content] = renderer.call(content: attrs[:content])
          attrs
        end
      end
    end
  end
end
