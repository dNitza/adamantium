require "down"

module Admin
  module Commands
    module Pages
      class Create
        include Deps["repos.page_repo"]

        def call(page:)
          page_repo.create(page)
        end
      end
    end
  end
end
