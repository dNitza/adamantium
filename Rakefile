# frozen_string_literal: true

require "dotenv"
require "hanami/rake_tasks"
require "down"

namespace :blog do
  task :load_environment do
    Dotenv.load("/home/blog/current/.env.production")
  end

  task :backfill_movie_imdb_ids => ["blog:load_environment"] do
    require "hanami/prepare"

    movie_repo = Admin::Container["repos.movie_repo"]

    movies = movie_repo.listing

    movies.each do |movie|
      record = movie_repo.by_url(url: movie.url)

      next unless record.imdb_id.nil?

      page = Down.download(movie.url)
      match = page.read.match(/href=".+title\/(tt\d+)\/maindetails"/)

      next unless match

      imdb_id = match[1]

      movie_repo.update(movie.id, {imdb_id: imdb_id})
    end
  end

  task :load_from_letterboxd => ["blog:load_environment"] do
    require "hanami/prepare"
    require "scraperd"

    client = Scraperd::Base.new
    activities = client.fetch('dnitza')

    create_command = Admin::Container["commands.movies.create"]

    activities.each do |activity|

      title = CGI.unescapeHTML(activity.title)

      create_command.({
                    title: title,
                    year: activity.year,
                    url: activity.film_link,
                    watched_at: activity.watched_at
                  })
    end
  end
end