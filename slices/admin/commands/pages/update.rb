require "down"

module Admin
  module Commands
    module Pages
      class Update
        include Deps["repos.page_repo"]

        def call(page:)
          id = page_repo.find(slug: page[:slug]).id

          page_repo.update(id, page)
        end
      end
    end
  end
end
