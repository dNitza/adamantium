require "reverse_markdown"

module Admin
  module Views
    module Posts
      class Show < Admin::View
        include Deps["repos.post_repo"]

        expose :post do |id:|
          post_repo.find(id: id)
        end

        expose :markdown_body do |post|
          ReverseMarkdown.convert(post.content, unknown_tags: :pass_through, github_flavored: true).to_s
        end
      end
    end
  end
end
