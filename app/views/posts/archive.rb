module Adamantium
  module Views
    module Posts
      class Archive < View
        include Deps["repos.post_repo"]

        expose :year do |year:|
          year
        end

        expose :posts do |year:|
          post_repo.by_year(year: year).map { |post| Decorators::Posts::Decorator.new(post) }
        end

        expose :post_years do
          post_repo.post_years.map { |py| py[:year].to_i }
        end
      end
    end
  end
end
