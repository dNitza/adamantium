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
        watched_at: activity.watched_at,
        rating: (activity.score / 2.0)
      })
    end
  end

  task load_twitter_archive: ["blog:load_environment"] do
    require "hanami/prepare"

    repo = Micropub::Container["repos.post_repo"]
    file = "tmp/tweets.json"
    tweets = JSON.parse(File.read(file))
    tweets.each do |tweet|
      next if tweet["tweet"]["full_text"].start_with? "@"
      tweet["tweet"]["full_text"] = tweet["tweet"]["full_text"].gsub(/(#{URI::DEFAULT_PARSER.make_regexp})/, "<a href='#{$1}'>#{$1}</a>")

      repo.create({slug: tweet["tweet"]["id"], content: tweet["tweet"]["full_text"], published_at: tweet["tweet"]["created_at"], category: ["tweet"], post_type: "post", syndication_sources: {twitter: "https://twitter.com/nitza/status/#{tweet["tweet"]["id"]}"}})
    end
  end

  task scrobble_podcasts: ["blog:load_environment"] do
    require "hanami/prepare"

    command = Adamantium::OvercastScrobbler.new(username: Hanami.app.settings.overcast_username, password: Hanami.app.settings.overcast_password)
    command.call
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

  task :create_user, [:email] => ["blog:load_environment"] do |t, args|
    require "hanami/prepare"

    user_repo = Admin::Container["repos.user_repo"]
    user_repo.create(id: SecureRandom.uuid, email: args[:email])
  end

  task clean_webmentions: ["blog:load_environment"] do
    require "hanami/prepare"
    require "que"

    Que.connection = Adamantium::Container["db.gateway"].connection
    Adamantium::Jobs::ArchiveDeletedWebmentions.enqueue
  end

  task gently_remind_me: ["blog:load_environment"] do
    require "hanami/prepare"
    require "que"

    command = Adamantium::GentlyRemindMe.new
    command.call(limit: 15)
  end
end

namespace :tailwind do
  desc "Watch and compile your Tailwind CSS on file changes"
    task :watch do
      system(
        "npx",
        "tailwindcss",
        "--input", "app/assets/css/tailwind.css",
        "--output", "app/assets/builds/tailwind.css",
        "--minify",
        "--watch"
      )
    end


    task :build do
      system(
        "npx",
        "tailwindcss",
        "--input", "app/assets/css/tailwind.css",
        "--output", "app/assets/builds/tailwind.css",
        "--minify"
      )
    end
end
