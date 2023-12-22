module Admin
  module Repos
    class BookRepo < Adamantium::Repo[:posts]
      commands :create, update: :by_pk

      def list_all
        posts
          .where(post_type: "book")
          .to_a
      end
    end
  end
end
