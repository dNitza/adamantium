module Admin
  module Views
    module AutoTagging
      class Index < Admin::View
        include Deps["repos.auto_tagging_repo"]

        expose :auto_taggings do
          auto_tagging_repo.listing
        end
      end
    end
  end
end
