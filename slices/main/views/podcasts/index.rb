module Main
  module Views
    module Podcasts
      class Index < Main::View
        include Deps["repos.podcast_repo", "repos.podcast_scrobble_repo"]

        expose :podcasts do
          podcast_repo.listing
        end

        expose :listens do
          podcast_scrobble_repo.listing
        end
      end
    end
  end
end
