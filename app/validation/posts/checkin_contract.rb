module Adamantium
  module Validation
    module Posts
      class CheckinContract < Dry::Validation::Contract
        params do
          required(:name).maybe(:string)
          required(:content).maybe(:string)
          required(:category).array(:string)
          required(:published_at).maybe(:time)
          required(:slug).filled(:string)
          required(:post_type).value(included_in?: %w[checkin])
          required(:syndication_sources).array(:string)
          required(:photos).array(:hash)
          required(:location).maybe(:string)
        end
      end
    end
  end
end
