module Adamantium
  module Commands
    module AutoTagging
      class Tag
        include Dry::Monads[:result]
        include Deps["repos.post_repo", "repos.auto_tagging_repo"]

        def call(auto_tag_id: nil)
          auto_taggings = if auto_tag_id
                auto_tagging_repo.find(auto_tag_id)
              else
                auto_tagging_repo.all
              end

          auto_taggings.each do |auto_tagging|
            posts = auto_tagging.title_only? ?
              post_repo.by_title(title_contains: auto_tagging.title_contains) :
              post_repo.by_content(body_contains: auto_tagging.body_contains)

            posts.each do |post|
              post_repo.auto_tag_post(post_id: post.id,
                                      tag_id: auto_tagging.tag_id)
            end
          end

          Success()
        end
      end
    end
  end
end
