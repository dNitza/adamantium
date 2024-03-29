# frozen_string_literal: true

require "dry/types"

module Micropub
  Types = Dry.Types

  module Types
    class Tag < Dry::Struct
      attribute :label, Types::Coercible::String
    end
  end
end
