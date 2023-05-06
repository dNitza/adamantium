module Admin
  module Validation
    module Contracts
      class AutoTaggingContract < Dry::Validation::Contract
        params do
          required(:title_contains).maybe(:string)
          required(:body_contains).maybe(:string)
          required(:tag_id).filled(:integer)
        end

        rule(:title_contains, :body_contains) do
          key.failure("must provide a title or body term") if values[:title_contains].nil? && values[:body_contains].nil?
          key.failure("must provide a title or body term") if !values[:title_contains].nil? && !values[:body_contains].nil?
        end
      end
    end
  end
end
