module Micropub
  module Validation
    module Posts
      class BookContract < Dry::Validation::Contract
        params do
          required(:name).maybe(:string)
          required(:content).filled(:string)
          required(:category).array(:string)
          required(:published_at).maybe(:time)
          required(:slug).filled(:string)
          required(:post_type).value(included_in?: %w[book])
          required(:book_author).maybe(:string)
          required(:book_status).value(included_in?: %w[to-read reading read finished])
        end
      end
    end
  end
end
