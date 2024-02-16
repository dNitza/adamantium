module Main
  module Views
    module Places
      class Index< Main::View
        include Deps["repos.post_repo"]

        expose :places do
          post_repo.places_listing.map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end
      end
    end
  end
end
