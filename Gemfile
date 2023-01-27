# frozen_string_literal: true

source "https://rubygems.org"

gem "hanami", "~> 2.0.0"
gem "hanami-router", "~> 2.0.0"
gem "hanami-controller", "~> 2.0.0"
gem "hanami-validations", "~> 2.0.0"
# gem "hanami-assets", github: "hanami/view", branch: "main"
gem "hanami-view", github: "hanami/view", branch: "main"

gem "rom-sql"
gem "pg"

gem "dry-types"
gem "dry-matcher"
gem "dry-monads"
gem "puma"
gem "rake"
gem "slim"
gem "builder"

gem "httparty"
gem "redcarpet"
gem "rexml"
gem "babosa"

group :development, :test do
  gem "dotenv"
end

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
end

group :test do
  gem "rack-test"
  gem "rom-factory"
  gem "database_cleaner-sequel"
  gem "timecop"
end
