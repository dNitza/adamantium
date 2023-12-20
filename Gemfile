# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.2"

gem "hanami", "2.1.0rc2"
gem "hanami-router", "2.1.0rc2"
gem "hanami-controller", "2.1.0rc2"
gem "hanami-validations", "2.1.0rc2"
gem "hanami-assets", "2.1.0rc2"
gem "hanami-view", "2.1.0rc2"

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

gem "rack-session"
gem "rack-rewrite"
gem "rack-contrib"

gem "ruby-readability", require: "readability"
gem "down"
gem "httparty"
gem "redcarpet"
gem "reverse_markdown"
gem "rexml"
gem "babosa"
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
  gem "irb"
  gem "hanami-reloader", "~> 2.1.0.rc"
end

group :cli, :development, :test do
  gem "hanami-rspec", "~> 2.1.0.rc"
end

group :development do
  gem "ed25519"
  gem "bcrypt_pbkdf"
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
