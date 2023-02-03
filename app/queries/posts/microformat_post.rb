require "reverse_markdown"

module Adamantium
  module Queries
    module Posts
      class MicroformatPost
        include Deps["repos.post_repo"]

        def call(url:, properties:)
          slug = URI(url).path.split("/").last

          post = post_repo.fetch!(slug)
          markdown_content = ReverseMarkdown.convert(post.content, unknown_tags: :raise, github_flavored: true).to_s

          if properties.nil? || properties.empty?
            return {
              type: ["h-entry"],
              properties: {
                published: [post.published_at],
                content: [markdown_content],
                category: post.tags.map { |t| t.label.to_s }
              }
            }
          end

          result = {properties: {}}
          result[:properties][:published] = [post.published_at] if properties.include? "published"
          result[:properties][:content] = [markdown_content] if properties.include? "content"
          result[:properties][:category] = post.tags.map { |t| t.label.to_s } if properties.include? "category"
          result
        end
      end
    end
  end
end
