module Admin
  module Commands
    module MergeTags
      class Merge
        include Dry::Monads[:result]
        include Deps["repos.post_tag_repo", "repos.tag_repo"]

        def call(target_id:, source_id:)
          post_tag_repo.merge_tags(target_id: target_id, source_id: source_id)
          tag_repo.delete(tag_id: source_id)

          Success()
        end
      end
    end
  end
end
