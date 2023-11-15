module Micropub
  module Commands
    module Posts
      class Delete < Adamantium::Command
        include Deps["repos.post_repo"]
        def call(params:)
          slug = URI(params[:url]).path.split("/").last

          post_repo.delete!(slug)
        end
      end
    end
  end
end
