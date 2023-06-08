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
end
