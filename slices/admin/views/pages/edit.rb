require "reverse_markdown"

module Admin
  module Views
    module Pages
      class Edit < Admin::View
        include Deps["repos.page_repo"]

        expose :page do |slug:|
          page_repo.find(slug: slug)
        end

        expose :markdown_content do |page|
          page.content
        end
      end
    end
  end
end
