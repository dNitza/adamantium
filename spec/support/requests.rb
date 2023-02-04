# require_with_metadata: true
# frozen_string_literal: true

require "rack/test"

RSpec.shared_context "Hanami app" do
  let(:app) { Hanami.app }
end

RSpec.configure do |config|
  config.include Rack::Test::Methods, :requests
  config.include_context "Hanami app", :requests
end
