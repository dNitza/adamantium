module Adamantium
  module Views
    module Pages
      class Show < Adamantium::View
        include Deps["repos.page_repo", renderer: "renderers.markdown"]

        expose :page_content do |page|
          renderer.call(content: page.content)
        rescue Errno::ENOENT
          renderer.call(content: "## Page not found")
        end

        expose :page_name do |page|
          page.name
        end

        private_expose :page do |slug:|
          page_repo.fetch!(slug: slug)
        end
      end
    end
  end
end
