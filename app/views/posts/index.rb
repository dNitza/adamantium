module Adamantium
  module Views
    module Posts
      class Index < Adamantium::View
        include Deps["repos.post_repo"]

        expose :posts do |post_query|
          post_query.map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end

        private_expose :post_query do |query|
          if query
            post_repo.search(term: query)
          else
            post_repo.post_listing
          end
        end

        expose :query do |query:|
          (query == "") ? nil : query
        end

        expose :post_years do
          post_repo.post_years.map { |py| py[:year].to_i }
        end
      end
    end
  end
end
