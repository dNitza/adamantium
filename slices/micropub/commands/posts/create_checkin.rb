require "dry/monads"

module Micropub
  module Commands
    module Posts
      class CreateCheckin < Adamantium::Command
        include Deps["repos.post_repo",
          "post_utilities.slugify",
          "logger",
          renderer: "renderers.markdown",
          add_post_syndication_source: "commands.posts.add_syndication_source"
                    ]

        include Dry::Monads[:result]

        def call(post)
          syndication_sources = post.delete(:syndication_sources)
          post_params = prepare_params(params: post)
          created_post = post_repo.create(post_params)

          syndication_sources.each do |url|
            add_post_syndication_source.call(created_post.id, :swarm, url)
          end

          # decorated_post = Decorators::Posts::Decorator.new(created_post)

          # send_webmentions.call(post_content: attrs[:content], post_url: decorated_post.permalink)

          Success(created_post)
        end

        private

        def prepare_params(params:)
          attrs = params.to_h
          attrs[:content] = renderer.call(content: attrs[:content]) if attrs[:content]
          attrs
        end
      end
    end
  end
end
