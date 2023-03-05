# frozen_string_literal: true

source "https://rubygems.org"

ruby "3.2.0"

gem "hanami", "~> 2.0.0"
gem "hanami-router", "~> 2.0.0"
gem "hanami-controller", "~> 2.0.0"
gem "hanami-validations", "~> 2.0.0"
# gem "hanami-assets", github: "hanami/view", branch: "main"
gem "hanami-view", git: "https://github.com/hanami/view", branch: "main"

gem "rom-sql"
gem "pg"

gem "dotenv"

gem "dry-types"
gem "dry-matcher"
gem "dry-monads"
gem "puma"
gem "rake"
gem "slim"
gem "builder"

gem "httparty"
gem "redcarpet"
gem "reverse_markdown"
gem "rexml"
gem "babosa"
gem "pinboard", git: "https://github.com/dnitza/pinboard", branch: "master"
gem "ogpr"
gem "ruby-filemagic", git: "https://github.com/dnitza/ruby-filemagic", branch: "master"
gem "webmention"
gem "sanitize"
gem "time_math2", require: "time_math"
gem "lastfm", "~> 1.27"

group :cli, :development do
  gem "hanami-reloader"
end

group :cli, :development, :test do
  gem "hanami-rspec"
end

group :development do
  gem "guard-puma", "~> 0.8"
  gem "standardrb"
  gem "capistrano", "~> 3.17", require: false
  gem "capistrano-bundler"
  gem "capistrano-rbenv", "~> 2.2"
  gem "capistrano3-puma", github: "seuros/capistrano-puma"
end

group :test do
  gem "rack-test"
  gem "rom-factory"
  gem "database_cleaner-sequel"
  gem "timecop"
end
