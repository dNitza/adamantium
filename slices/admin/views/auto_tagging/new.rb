module Admin
  module Views
    module AutoTagging
      class New < Admin::View

        include Deps["repos.tag_repo"]

        expose :tags do
          tag_repo.list.to_a
        end
      end
    end
  end
end