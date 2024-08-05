module Test
  module DB
    module Helpers
      module_function

      def relations
        rom.relations
      end

      def rom
        Hanami.app["db.rom"]
      end

      def db
        Hanami.app["db.gateway"].connection
      end
    end
  end
end
