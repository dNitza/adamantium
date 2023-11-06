# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "hanami", github: "hanami/hanami", branch: "main"
gem "hanami-router", github: "hanami/router", branch: "main"
gem "hanami-controller", github: "hanami/controller", branch: "main"
gem "hanami-validations", github: "hanami/validations", branch: "main"
gem "hanami-assets", github: "hanami/assets", branch: "main"
gem "hanami-view", github: "hanami/view", branch: "main"

gem "rom-sql"
gem "pg"
gem "scraperd", github: "dNitza/scraperd", branch: "master"

gem "dotenv"

gem "dry-types"
gem "dry-matcher"
gem "dry-monads"
gem "puma"
gem "rake"
gem "slim"
gem "builder"
gem "georuby"
gem "gpx"
gem "gnuplot"
gem "matrix"

gem "ruby-readability", require: "readability"
gem "down"
gem "httparty"
gem "redcarpet"
gem "reverse_markdown"
gem "rexml"
gem "babosa"
gem "pinboard", git: "https://github.com/dnitza/pinboard", branch: "master"
gem "bskyrb"
gem "ogpr"
gem "ruby-filemagic", git: "https://github.com/dnitza/ruby-filemagic", branch: "master"
gem "webmention"
gem "sanitize"
gem "time_math2", require: "time_math"
gem "jwt"
gem "lastfm", "~> 1.27"
gem "mail"
gem "que"
gem "connection_pool"
gem "omdb-api", "1.4.3", require: false
gem "image_processing", "~> 1.0"

gem "sentry-ruby"

gem "warning"

group :cli, :development do
  gem "hanami-reloader"
end

group :cli, :development, :test do
  gem "hanami-rspec"
end

group :development do
  gem "guard-puma", "~> 0.8"
  gem "standardrb"
  gem "capistrano", "~> 3.7", require: false
  gem "capistrano-bundler"
  gem "capistrano-systemd-multiservice"
  gem "capistrano-rbenv", "~> 2.2"
  gem "capistrano3-puma", github: "seuros/capistrano-puma"
end

group :test do
  gem "rack-test"
  gem "rom-factory"
  gem "database_cleaner-sequel"
  gem "timecop"
end
