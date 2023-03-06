require "time_math"

module Adamantium
  module Views
    module Posts
      class Show < Adamantium::View
        include Deps["repos.post_repo"]

        expose :post do |slug:|
          Decorators::Posts::Decorator.new(post_repo.fetch!(slug))
        end

        expose :past_posts do |post|
          start_date = TimeMath.week.floor(post.published_at)
          end_date = TimeMath.week.ceil(post.published_at)
          posts = post_repo.from_the_archives(start_date: start_date, end_date: end_date)
          posts.map { |p| Decorators::Posts::Decorator.new(p) }
        end
      end
    end
  end
end
