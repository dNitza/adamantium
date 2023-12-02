require "reverse_markdown"

module Micropub
  module Queries
    module Posts
      class MicroformatPost
        include Deps["settings", "repos.post_repo"]

        def call(url:, filter:, properties:)
          if url
            fetch_post(url: url, properties: properties)
          end

          if filter
            search_posts(filter: filter)
          end
        end

        private

        def fetch_post(url:, properties:)
          slug = URI(url).path.split("/").last

          post = post_repo.fetch_unpublished!(slug)
          markdown_content = ReverseMarkdown.convert(post.content, unknown_tags: :pass_through, github_flavored: true).to_s

          if properties.nil? || properties.empty?
            return {
              type: ["h-entry"],
              properties: {
                published: [post.published_at],
                content: [markdown_content],
                photo: post.photos,
                category: post.tags.map { |t| t.label.to_s }
              }
            }
          end

          result = {properties: {}}
          result[:properties][:published] = [post.published_at] if properties.include? "published"
          result[:properties][:content] = [markdown_content] if properties.include? "content"
          result[:properties][:category] = post.tags.map { |t| t.label.to_s } if properties.include? "category"
          result[:properties][:photos] = post.photos if properties.include? "photos"
          result
        end

        def search_posts(filter:)
          posts = post_repo
            .search(term: filter)
            .map { |post|
              content = ReverseMarkdown.convert(post.content, unknown_tags: :pass_through, github_flavored: true).to_s

              {
                type: ["h-entry"],
                properties: {
                  url: ["#{settings.micropub_site_url}/post/#{post.slug}"],
                  uid: [post.id],
                  published: [post.published_at],
                  content: [content],
                  photo: post.photos,
                  category: post.tags.map { |t| t.label.to_s }
                }
              }
            }

          {
            items: posts
          }
        end
      end
    end
  end
end
