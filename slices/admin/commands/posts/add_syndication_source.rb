require "readability"
require "down"

module Admin
  module Commands
    module Posts
      class AddSyndicationSource
        include Dry::Monads[:result]
        include Deps["repos.post_repo"]

        def call(post_id:, source_name:, source_url:)
          post = post_repo.find(id: post_id)
          syndication_sources = post[:syndication_sources]
          updated_syndication_sources = syndication_sources.merge(source_name => source_url)

          post_repo.update(post_id, syndication_sources: updated_syndication_sources)
          Success()
        end
      end
    end
  end
end
