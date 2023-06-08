# frozen_string_literal: false

# auto_register: false

module Adamantium
  module Decorators
    module Movies
      class Decorator < SimpleDelegator
        include Deps["clients.omdb"]

        def poster
          omdb_record.poster
        end

        def omdb_record
          @omdb_record ||= omdb.call(imdb_id: imdb_id)
        end
      end
    end
  end
end
