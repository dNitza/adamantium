module Adamantium
  module Views
    module Tags
      class Show < Adamantium::View
        include Deps[
          "repos.post_tag_repo",
          "repos.tag_repo"
                ]

        expose :posts do |slug:|
          post_tag_repo.posts_tagged(tag: slug).map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end

        expose :tag do |slug:|
          tag_repo.fetch!(slug)
        end
      end
    end
  end
end
