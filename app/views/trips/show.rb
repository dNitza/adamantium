module Adamantium
  module Views
    module Trips
      class Show < Adamantium::View
        include Deps[
                  "repos.trip_repo"
                ]

        expose :posts do |trip|
          trip.posts.sort { |p, x| p.published_at.to_i <=> x.published_at.to_i }.map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end

        expose :trip do |id:|
          trip_repo.fetch!(id)
        end
      end
    end
  end
end
