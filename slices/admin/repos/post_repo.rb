require "time_math"

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
          .order(Sequel.lit("published_at desc"))
          .to_a
      end

      def delete(id:)
        posts.where(id: id).delete
      end

      def publish(id:)
        posts.where(id: id).update(published_at: Time.now)
      end

      def archive(id:)
        posts.where(id: id).update(published_at: nil)
      end

      def created_between(start_date, end_date)
        end_date = TimeMath.month.advance(end_date, +2)

        posts
          .combine(:trips)
          .where(post_type: %w[post check-in])
          .published_between(start_date, end_date)
      end
    end
  end
end