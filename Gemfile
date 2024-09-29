# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.3.0"

gem "hanami", "~> 2.2.0.beta"
gem "hanami-router", "~> 2.2.0.beta"
gem "hanami-controller", "~> 2.2.0.beta"
gem "hanami-validations", "~> 2.2.0.beta"
gem "hanami-assets", "~> 2.2.0.beta"
gem "hanami-view", "~> 2.2.0.beta"
gem "hanami-db", "~> 2.2.0.beta"
# gem "hanami-view", file: "~/Documents/projects/hanami/view"

gem "csv"
gem "rom-sql"
gem "pg"

gem "dotenv"
gem "whenever", require: false
gem "warning"

gem "dry-types", "~> 1.0", ">= 1.6.1"
gem "dry-matcher"
gem "dry-monads"
gem "puma"
gem "rake"
gem "slim"
gem "builder"
gem "gpx"

gem "redis"

gem "georuby"
gem "gnuplot"
gem "matrix"

gem "rack-session"
gem "rack-rewrite"
gem "rack-contrib"
gem "rack-attack", "~> 6.7"

gem "ruby-readability", require: "readability"
gem "down"
gem "httparty"
gem "redcarpet"
gem "reverse_markdown"
gem "rexml"
gem "babosa"
gem "ruby-filemagic", git: "https://github.com/dnitza/ruby-filemagic", branch: "master"
gem "charlock_holmes"
gem "sanitize"
gem "time_math2", require: "time_math"
gem "jwt"
gem "mail"
gem "que"
gem "connection_pool"
gem "image_processing", "~> 1.0"
gem "unicode-emoji"

gem "mail_room", github: "dNitza/mail_room", branch: "master"
gem "scraperd", github: "dNitza/scraperd", branch: "master"
gem "bskyrb"
gem "ogpr"
gem "omdb-api", "1.4.3", require: false
gem "lastfm", "~> 1.27"
gem "steam-api"

group :cli, :development do
  gem "irb"
  gem "hanami-reloader", "~> 2.2.0.beta"
  gem "rubocop", require: false
end

group :cli, :development, :test do
  gem "hanami-rspec", "~> 2.1.0.rc"
end

group :development do
  gem "ed25519"
  gem "bcrypt_pbkdf"
  gem "hanami-webconsole", "~> 2.2.0.beta"
  gem "guard-puma"
  gem "standard", ">= 1.35.1"
  gem "capistrano", "~> 3.7", require: false
  gem "capistrano-bundler"
  gem "capistrano-systemd-multiservice"
  gem "capistrano-rbenv", "~> 2.2"
  gem "capistrano3-puma", github: "seuros/capistrano-puma"
  gem "vernier"
end

group :test do
  gem "rack-test"
  gem "rom-factory"
  gem "database_cleaner-sequel"
  gem "timecop"
end


gem "mini_magick", "~> 4.13"
