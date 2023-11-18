# frozen_string_literal: true

require "dotenv"
require "hanami/rake_tasks"
require "down"

namespace :blog do
  task :load_environment do
    Dotenv.load("/home/blog/current/.env.production")
  end

  task load_from_letterboxd: ["blog:load_environment"] do
    require "hanami/prepare"
    require "scraperd"

    client = Scraperd::Base.new
    activities = client.fetch("dnitza")

    create_command = Admin::Container["commands.movies.create"]

    activities.each do |activity|
      title = CGI.unescapeHTML(activity.title)

      create_command.call({
        title: title,
        year: activity.year,
        url: activity.film_link,
        watched_at: activity.watched_at
      })
    end
  end

  task load_from_bookshelf: ["blog:load_environment"] do
    require "hanami/prepare"
    require "csv"
    require "sequel"

    post_repo = Adamantium::Container["repos.post_repo"]

    CSV.open("tmp/books.csv", headers: true).each do |book|
      next if book["isbn13"].nil?
      post_repo.create(
        name: book["title"],
        post_type: "book",
        book_status: book["readingStatus"],
        slug: "isbn:#{book["isbn13"]}",
        book_author: book["authors"],
        content: book["description"],
        category: [],
        published_at: Time.now
      )
    end
  end
end

namespace :tailwind do
  task :watch do
    system("npx tailwindcss -i ./app/assets/css/tailwind.css -o ./app/assets/builds/tailwind.css --watch")
  end

  task :build do
    system("npx tailwindcss -i ./app/assets/css/tailwind.css -o ./app/assets/builds/tailwind.css --minify")
  end
end
