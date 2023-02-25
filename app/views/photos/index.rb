module Adamantium
  module Views
    module Photos
      class Index < Adamantium::View
        include Deps["repos.post_repo"]

        expose :photos do
          post_repo.photo_listing.map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end
      end
    end
  end
end
