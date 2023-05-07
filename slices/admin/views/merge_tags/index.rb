module Admin
  module Views
    module MergeTags
      class Index < Admin::View

        include Deps["repos.tag_repo"]

        expose :tags do
          tag_repo.list_with_posts
        end
      end
    end
  end
end