# auto_register: false
# frozen_string_literal: true

require "dry-matcher"
require "dry/matcher/result_matcher"
require "dry-monads"

module Adamantium
  class Command
    include Dry::Matcher.for(:call, with: Dry::Matcher::ResultMatcher)
    include Dry::Monads[:result]
  end
end
