module Admin
  module Repos
    class MovieRepo < Adamantium::Repo[:movies]
      commands :create

      def by_title_and_year(title:, year:)
        movies.where(title: title, year: year).one
      end

      def by_url(url:)
        movies.where(url: url).one
      end

      def listing
        movies.order(Sequel.lit("year desc")).to_a
      end

      def update(id, attrs)
        movies.where(id: id).update(attrs)
      end
    end
  end
end