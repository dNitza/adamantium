module Micropub
  module Validation
    module Posts
      class CodeContract < Dry::Validation::Contract
        params do
          required(:name).maybe(:string)
          required(:content).filled(:string)
          required(:programming_language).filled(:string)
          required(:published_at).maybe(:time)
          required(:slug).filled(:string)
          required(:post_type).value(included_in?: %w[code])
          required(:syndicate_to).array(:string)
        end
      end
    end
  end
end
