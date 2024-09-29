module Admin
  module Views
    module Posts
      class New < Admin::View
        include Deps["repos.post_repo"]

        expose :published_posts do |posts|
          posts[0]
        end

        expose :unpublished_posts do |posts|
          posts[1]
        end

        expose :posts do
          post_repo.list.partition { |p| p.published_at }
        end
      end
    end
  end
end
