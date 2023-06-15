# frozen_string_literal: true

require "pathname"
require "warning"
SPEC_ROOT = Pathname(__dir__).realpath.freeze

ENV["HANAMI_ENV"] ||= "test"
require "hanami/prepare"

require "timecop"

require_relative "support/rspec"
require_relative "support/feature_loader"

Gem.path.each do |path|
  Warning.ignore(//, path)
end
