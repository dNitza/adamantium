module Adamantium
  module Repos
    class PostTagRepo < Adamantium::Repo[:post_tags]
      def posts_tagged(tag:)
        tag_id = post_tags
          .tags
          .where(slug: tag)
          .one!
          .id

        post_ids = post_tags
          .where(tag_id: tag_id)
          .to_a
          .map(&:post_id)

        post_tags
          .posts
          .where(id: post_ids)
          .published
          .combine(:tags)
          .order(Sequel.desc(:published_at))
          .to_a
      end
    end
  end
end
