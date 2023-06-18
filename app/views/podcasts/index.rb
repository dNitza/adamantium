module Adamantium
  module Views
    module Podcasts
      class Index < View
        include Deps["repos.podcast_repo"]

        expose :podcasts do
          podcast_repo.listing
        end
      end
    end
  end
end
