module Admin
  module Commands
    module Media
      class Delete
        include Dry::Monads[:result]

        def call(path:)
          File.delete(path)

          Success()
        end
      end
    end
  end
end
