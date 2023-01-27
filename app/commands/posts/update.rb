module Adamantium
  module Commands
    module Posts
      class Update < Command
        def call(params)
          slug = URI(params[:url]).path.split("/").last

          post_repo.update(slug, params)
        end
      end
    end
  end
end
