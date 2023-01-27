module Adamantium
  module Commands
    module Posts
      class Undelete < Command
        include Deps["repos.post_repo"]
        def call(params:)
          slug = URI(params[:url]).path.split("/").last

          post_repo.restore!(slug)
        end
      end
    end
  end
end
