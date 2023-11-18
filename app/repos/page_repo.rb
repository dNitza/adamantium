module Adamantium
  module Repos
    class PageRepo < Adamantium::Repo[:pages]
      def fetch!(slug:)
        pages
          .published
          .where(slug: slug).one!
      end
    end
  end
end
