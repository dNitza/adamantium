module Micropub
  module Commands
    module Posts
      class AddSyndicationSource
        include Deps["repos.post_repo"]

        def call(post_id, source, url)
          post = post_repo.find!(post_id).to_h
          syndication_sources = post[:syndication_sources] || {}
          syndication_sources[source] = url
          post[:syndication_sources] = syndication_sources

          post_repo.update(post_id, post)
        end
      end
    end
  end
end
