module Admin
  module Commands
    module AutoTagging
      class Create
        include Dry::Monads[:result]
        include Deps["repos.auto_tagging_repo"]

        def call(title_contains:, body_contains:, tag_id:)
          Failure() if !title_contains.empty? && !body_contains.empty?

          result = auto_tagging_repo.create(title_contains: title_contains,
                                            body_contains: body_contains,
                                            tag_id: tag_id)

          Success(result.id)
        end
      end
    end
  end
end
