module Admin
  module Repos
    class BookmarkRepo < Adamantium::DB::Repo[:posts]
      def list
        posts
          .where(post_type: "bookmark")
          .order(Sequel.lit("published_at desc"))
          .to_a
      end

      def list_published
        posts
          .published
          .where(post_type: "bookmark")
          .to_a
      end

      def fetch(id:)
        posts.where(id: id).one
      end

      def delete(id:)
        posts.where(id: id).delete
      end

      def archive(id:)
        posts.where(id: id).update(published_at: nil)
      end

      def publish(id:)
        posts.where(id: id).update(published_at: Time.now)
      end

      def update(id:, params:)
        posts.where(id: id).update(params)
      end

      def mark_read(id:)
        posts.where(id: id).update(is_read: true)
      end

      def mark_unread(id:)
        posts.where(id: id).update(is_read: false)
      end
    end
  end
end
