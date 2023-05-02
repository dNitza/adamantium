module Adamantium
  module Repos
    class MovieRepo < Adamantium::Repo[:movies]
      commands :create

      def listing
        movies.order(Sequel.lit("year desc")).to_a
      end

      def by_title_and_year(title:, year:)
        movies.where(title: title, year: year).one
      end
    end
  end
end