require "dry/monads"

module Adamantium
  module Commands
    module Posts
      class CreateEntry < Command
        include Deps["repos.post_repo",
          "post_utilities.slugify",
          renderer: "renderers.markdown",
          syndicate: "commands.posts.syndicate",
          send_to_dayone: "syndication.dayone",
          send_webmentions: "commands.posts.send_webmentions",
                    ]

        include Dry::Monads[:result]

        def call(post)
          post_params = prepare_params(params: post)
          created_post = post_repo.create(post_params)

          send_to_dayone.call(name: post[:name], content: post[:content]) if post[:category].include? "weekly"
          syndicate.call(created_post.id, post)

          # decorated_post = Decorators::Posts::Decorator.new(created_post)

          # send_webmentions.call(post_content: attrs[:content], post_url: decorated_post.permalink)

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
