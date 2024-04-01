module Main
  module Views
    module PastWeek
      class Index < Main::View
        config.layout = false

        include Deps["repos.post_repo"]

        expose :past_week do
          post_repo.week_posts(limit: 1).to_a.map do |post|
            Decorators::Posts::Decorator.new(post)
          end.first
        end
      end
    end
  end
end
