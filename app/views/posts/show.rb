module Adamantium
  module Views
    module Posts
      class Show < Adamantium::View
        include Deps["repos.post_repo"]

        expose :post do |slug:|
          Decorators::Posts::Decorator.new(post_repo.fetch!(slug))
        end
      end
    end
  end
end
