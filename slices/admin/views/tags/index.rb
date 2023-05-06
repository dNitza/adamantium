module Admin
  module Views
    module Tags
      class Index < Admin::View

        include Deps["repos.tag_repo"]

        expose :tags do
          tag_repo.list_with_posts.to_a
        end

        expose :unused_tags do |tags|
          tags.partition {|t| t.posts.count == 0}.first
        end

        expose :used_tags do |tags|
          tags.partition {|t| t.posts.count == 0}.last
        end
      end
    end
  end
end