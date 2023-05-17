module Adamantium
  module Views
    module Bookmarks
      class Show < View
        include Deps["repos.post_repo"]

        expose :bookmark do |slug:|
          Decorators::Bookmarks::Decorator.new(post_repo.fetch!(slug))
        end
      end
    end
  end
end
