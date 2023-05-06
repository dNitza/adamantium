module Admin
  module Repos
    class TagRepo < Adamantium::Repo[:tags]
      def list
        tags
          .order(Sequel.function(:lower, :label))
          .to_a
      end
      def list_with_posts
        tags
          .combine(:posts)
          .order(Sequel.function(:lower, :label))
          .to_a
      end

      def delete(tag_id:)
        tags.by_pk(tag_id).delete
      end
    end
  end
end
