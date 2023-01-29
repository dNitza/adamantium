# require_with_metadata: true
# frozen_string_literal: true

require_relative "db/helpers"
require_relative "db/database_cleaner"
require_relative "db/factory"

RSpec.configure do |config|
  config.before :suite do
    Hanami.app.start :persistence
  end

  config.include Test::DB::Helpers, :db

  config.include(Test::DB::FactoryHelper.new, factory: nil)
end
