module Adamantium
  module Views
    module Movies
      class Index < View

        include Deps["repos.movie_repo"]

        expose :movies do
          movie_repo.listing
        end
      end
    end
  end
end
