module Admin
  module Repos
    class WebmentionRepo < Adamantium::Repo[:webmentions]
      commands update: :by_pk

      def list_all_for_check
        webmentions
          .exclude(source_url: "email")
          .order(:id)
          .to_a
      end

      def list_all
        webmentions
          .order(:id)
          .to_a
      end
    end
  end
end
