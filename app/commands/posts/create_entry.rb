require "dry/monads"

module Adamantium
  module Commands
    module Posts
      class CreateEntry < Command
        include Deps["repos.post_repo",
          "post_utilities.slugify",
          renderer: "renderers.markdown",
          syndicate: "commands.posts.syndicate",
          add_post_syndication_source: "commands.posts.add_syndication_source",
          send_webmentions: "commands.posts.send_webmentions",
                    ]

        include Dry::Monads[:result]

        def call(post)
          attrs = post.to_h
          attrs[:content] = renderer.call(content: attrs[:content])

          created_post = post_repo.create(attrs)

          syndicate.call(attrs).bind do |results|
            results.each do |result|
              source, url = result
              add_post_syndication_source.call(created_post.id, source, url)
            end
          end

          decorated_post = Decorators::Posts::Decorator.new(created_post)

          # send_webmentions.call(post_content: attrs[:content], post_url: decorated_post.permalink)

          Success(created_post)
        end
      end
    end
  end
end
