module Admin
  module Commands
    module Highlight
      class Create
        include Dry::Monads[:result]
        include Deps["repos.highlight_repo"]

        def call(post_id:, text:)
          highlight_repo.create(post_id:, text:)

          Success()
        end
      end
    end
  end
end
