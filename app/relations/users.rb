# frozen_string_literal: true

module Adamantium
  module Relations
    class Users < ROM::Relation[:sql]
      schema :users, infer: true

      auto_struct(true)
    end
  end
end
