module Micropub
  module Validation
    module Posts
      class BookmarkContract < Dry::Validation::Contract
        include Deps["repos.post_repo"]

        params do
          required(:name).filled(:string)
          required(:content).maybe(:string)
          required(:category).array(:string)
          required(:published_at).maybe(:time)
          required(:url).filled(:string)
          required(:slug).filled(:string)
          required(:post_type).value(included_in?: %w[bookmark])
          required(:syndicate_to).array(:string)
          required(:photos).array(:hash)
          required(:cache).filled(:bool)
        end

        rule(:url) do
          key.failure("URL already bookmarked") if post_repo.url_exists?(values[:url])
        end
      end
    end
  end
end
