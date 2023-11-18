# frozen_string_literal: true

module Adamantium
  module Relations
    class LoginTokens < ROM::Relation[:sql]
      schema :login_tokens, infer: true

      auto_struct(true)
    end
  end
end
