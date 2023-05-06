# frozen_string_literal: true

require "hanami/rake_tasks"

namespace :blog do
  task :load_from_letterboxd do
    require "hanami/prepare"
    require "scraperd"

    client = Scraperd::Base.new
    activities = client.fetch('dnitza')

    repo = Adamantium::Container["repos.movie_repo"]

    activities.each do |activity|

      title = CGI.unescapeHTML(activity.title)

      next if repo.by_title_and_year(title: title, year: activity.year)

      repo.create({
                    title: title,
                    year: activity.year,
                    url: activity.film_link
                  })
    end
  end
end