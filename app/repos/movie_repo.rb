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

      def from_the_archives(start_date:, end_date:)
        # SELECT * FROM posts
        # WHERE EXTRACT(month FROM "published_at") >= 2
        # WHERE EXTRACT(month FROM "published_at") <= 2+
        # AND EXTRACT(day FROM "published_at") > 20
        # AND EXTRACT(day FROM "published_at") < 27
        # AND post_type = 'post';

        movies
          .where { Sequel.extract(:year, :watched_at) >= start_date.year }
          .where { Sequel.extract(:year, :watched_at) <= start_date.year }
          .where { Sequel.extract(:month, :watched_at) >= start_date.month }
          .where { Sequel.extract(:month, :watched_at) <= end_date.month }
          .where { Sequel.extract(:day, :watched_at) >= start_date.day }
          .where { Sequel.extract(:day, :watched_at) <= end_date.day }
          .to_a
      end
    end
  end
end