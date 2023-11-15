require "dry/monads"

module Micropub
  module Commands
    module Posts
      class CreateEntry < Adamantium::Command
        include Deps["repos.post_repo",
          "post_utilities.slugify",
          renderer: "renderers.markdown",
          syndicate: "commands.posts.syndicate",
          send_to_dayone: "syndication.dayone",
          send_webmentions: "commands.posts.send_webmentions",
          auto_tag: "commands.auto_tagging.tag",
                    ]

        include Dry::Monads[:result]

        def call(post)
          post_params = prepare_params(params: post)
          created_post = post_repo.create(post_params)

          auto_tag.call

          syndicate.call(created_post.id, post)

          decorated_post = Decorators::Posts::Decorator.new(created_post)

          send_webmentions.call(post_content: created_post.content, post_url: decorated_post.permalink)

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
