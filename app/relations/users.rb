# frozen_string_literal: true

module Adamantium
  module Relations
    class Users < Adamantium::DB::Relation
      schema :users, infer: true

      auto_struct(true)
    end
  end
end
