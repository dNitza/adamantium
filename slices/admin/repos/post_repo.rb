module Admin
  module Repos
    class PostRepo < Adamantium::Repo[:posts]
      def tag_post(post_id:, tag_id:)

        return if posts
                    .post_tags
                    .where(
                      post_id: post_id,
                      tag_id: tag_id
                    ).count > 0

        posts
          .post_tags
          .changeset(:create, {
            post_id: post_id,
            tag_id: tag_id
          })
          .commit
      end

      def by_title(title_contains:)
        posts
          .where(post_type: "post")
          .published
          .where(Sequel.ilike(:name, "%#{title_contains}%")).to_a
      end

      def by_content(body_contains:)
        posts
          .where(post_type: "post")
          .published
          .where(Sequel.ilike(:content, "%#{body_contains}%")).to_a
      end

      def list
        posts
          .where(post_type: "post")
          .to_a
      end

      def delete(id:)
        posts.where(id: id).delete
      end

      def archive(id:)
        posts.where(id: id).update(published_at: nil)
      end

      def created_between(start_date, end_date)
        posts
          .combine(:trips)
          .published_between(start_date, end_date)
      end
    end
  end
end