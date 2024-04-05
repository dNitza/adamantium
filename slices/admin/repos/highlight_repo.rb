module Admin
  module Repos
    class HighlightRepo < Adamantium::Repo[:highlights]
      commands :create, delete: :by_pk

      def list_all
        highlights
          .to_a
      end
    end
  end
end
