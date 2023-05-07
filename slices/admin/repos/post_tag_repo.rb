module Admin
  module Repos
    class PostTagRepo < Adamantium::Repo[:post_tags]

      def delete(tag_id:)
        post_tags.where(tag_id: tag_id).delete
      end

      def delete_by_post_id(post_id:)
        post_tags.where(post_id: post_id).delete
      end
    end
  end
end
