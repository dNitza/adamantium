module Micropub
  module Commands
    module Posts
      class Undelete < Adamantium::Command
        include Deps["repos.post_repo"]
        def call(params:)
          slug = URI(params[:url]).path.split("/").last

          post_repo.restore!(slug)
        end
      end
    end
  end
end
