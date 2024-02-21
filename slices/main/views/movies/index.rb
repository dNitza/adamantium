module Main
  module Views
    module Movies
      class Index < Main::View
        include Deps["repos.movie_repo"]

        expose :movies do
          movie_repo.listing
        end
      end
    end
  end
end
