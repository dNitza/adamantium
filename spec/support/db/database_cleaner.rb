require "sequel"
require "database_cleaner/sequel"
require_relative "helpers"

DatabaseCleaner[:sequel].strategy = :transaction

RSpec.configure do |config|
  config.prepend_before :each, type: :db do |example|
    strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner[:sequel].strategy = strategy

    DatabaseCleaner[:sequel].start
  end

  config.append_after :each, type: :db do
    DatabaseCleaner[:sequel].clean
  end
end
