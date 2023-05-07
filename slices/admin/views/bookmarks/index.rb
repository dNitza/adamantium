module Admin
  module Views
    module Bookmarks
      class Index < Admin::View

        include Deps["repos.bookmark_repo"]

        expose :bookmarks do
          bookmark_repo.list
        end
      end
    end
  end
end