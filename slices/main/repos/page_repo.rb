module Main
  module Repos
    class PageRepo < Adamantium::Repo[:pages]
      def fetch!(slug:)
        pages
          .published
          .where(slug: slug).one!
      end

      def for_main_nav
        pages
          .select(:name, :slug, :light_colour, :dark_colour, :published_at)
          .published
          .where(main_menu: true)
          .to_a
      end
    end
  end
end
