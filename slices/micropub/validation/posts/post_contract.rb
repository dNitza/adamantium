module Micropub
  module Validation
    module Posts
      class PostContract < Dry::Validation::Contract
        params do
          required(:name).maybe(:string)
          required(:content).filled(:string)
          required(:category).array(:string)
          required(:published_at).maybe(:time)
          required(:slug).filled(:string)
          required(:post_type).value(included_in?: %w[post])
          required(:syndicate_to).array(:string)
          required(:photos).array(:hash)
          required(:location).maybe(:string)
          required(:in_reply_to).maybe(:string)
          required(:emoji).maybe(:string)
        end
      end
    end
  end
end
