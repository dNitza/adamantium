require "down"

module Admin
  module Commands
    module Movies
      class Create
        include Deps["repos.movie_repo"]

        def call(movie)
          repo = Container["repos.movie_repo"]

          return if repo.by_title_and_year(title: movie[:title], year: movie[:year])

          page = Down.download(movie[:url])
          match = page.read.match(/href=".+title\/(tt\d+)\/maindetails"/)
          imdb_id = match[1]

          movie = movie.merge(imdb_id: imdb_id) if imdb_id

          repo.create(movie)
        end
      end
    end
  end
end
