module Admin
  module Views
    module Posts
      class Index < Admin::View

        include Deps["repos.post_repo"]

        expose :posts do
          post_repo.list
        end
      end
    end
  end
end