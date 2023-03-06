module Adamantium
  module Views
    module Site
      class Home < Adamantium::View
        include Deps["repos.post_repo", renderer: "renderers.markdown"]

        expose :home_content do
          markdown_content = File.read("app/content/home.md")

          renderer.call(content: markdown_content)
        end

        expose :posts do
          post_repo.post_listing(limit: 5).map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end

        expose :photo_posts do
          post_repo.photo_listing(limit: 12).map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end

        expose :latest_status do
          post_repo.latest_status ? Decorators::Posts::Decorator.new(post_repo.latest_status) : nil
        end

        expose :last_location do
          post_repo.last_location ? Decorators::Posts::Decorator.new(post_repo.last_location) : nil
        end
      end
    end
  end
end
