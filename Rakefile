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

  task load_from_overcast: ["blog:load_environment"] do
    require "nokogiri"
    require "hanami/prepare"
    require "down"

    podcast_repo = Adamantium::Container["repos.podcast_repo"]
    settings = Adamantium::Container["settings"]

    doc = File.open("tmp/overcast.opml") { |f| Nokogiri::XML(f) }
    doc.xpath("//outline[@type='rss']").each do |outline|
      overcast_id = outline.get_attribute("overcastId")
      url = "https://public.overcast-cdn.com/art/#{overcast_id}_thumb"
      destination = File.join("public", "media", "podcast_art", "#{overcast_id}.jpg")
      Down.download(url, destination: destination)

      podcast_repo.create(
        name: outline.get_attribute("title"),
        url: outline.get_attribute("htmlUrl"),
        overcast_id: outline.get_attribute("overcastId")
      )
    end
  end
end
