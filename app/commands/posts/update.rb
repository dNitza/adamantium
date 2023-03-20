module Adamantium
  module Commands
    module Posts
      class Update < Command
        include Deps[
          "repos.post_repo",
          "renderers.markdown",
          "commands.posts.add_syndication_source"
        ]

        def call(params:)
          slug = URI(params[:url]).path.split("/").last
          post = post_repo.fetch!(slug)

          if params.key? :replace
            content = params[:replace].delete(:content).first
            name = params[:replace].delete(:name)

            attrs_to_replace = {}
            attrs_to_replace[:name] = name if name
            attrs_to_replace[:content] = markdown.call(content: content) if content

            post_repo.update(post.id, attrs_to_replace)
          end

          if params.key? :add
            attrs_to_add = {}

            syndication = params[:add].delete(:syndication)&.first
            tags = params[:add].delete(:category)
            content = params[:add].delete(:content)&.first
            name = params[:add].delete(:name)

            attrs_to_add[:name] = name if post.name.empty?
            attrs_to_add[:content] = markdown.call(content: content) if post.content.empty?

            params[:add].keys.each_with_object(attrs_to_add) do |attr, memo|
              memo[attr] = params[:add][attr].first if post.fetch(attr, nil).nil?
            end

            post_repo.update(post.id, attrs_to_add) unless attrs_to_add.empty?

            post_repo.tag_post(post_id: post.id, tags: tags) if tags && !tags.empty?
            add_syndication_source.call(post.id, "", syndication) if syndication && !syndication.empty?
          end

          if params.key? :delete
            if params[:delete].is_a? Hash
              tags = params[:delete][:category]
              tags&.each do |tag|
                post_repo.remove_tag(post_id: post.id, tag: tag)
              end
            elsif params[:delete].is_a? Array
              if params[:delete].delete("category")
                post.tags.each do |tag|
                  post_repo.remove_tag(post_id: post.id, tag: tag.label)
                end
              end

              attrs = {}
              params[:delete].each do |attr|
                attrs[attr.to_sym] = nil
              end

              post_repo.update(post.id, attrs) unless attrs.empty?
            end
          end
        end
      end
    end
  end
end
