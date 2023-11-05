module Adamantium
  module Views
    module Tags
      class Index < View
        include Deps["repos.tag_repo"]

        expose :tag_groups do
          tag_repo
            .list
            .group_by { |tag|
              grouper = tag.label.strip[0].downcase
              /[a-z]/.match?(grouper) ? grouper : "#"
            }
            .sort
            .map { |group, tags| {group: group, tags: tags.map {|tag| {tag: tag, count: tag.posts.count} }} }
        end
      end
    end
  end
end
