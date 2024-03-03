module Main
  module Views
    module Pages
      class Show < Main::View
        include Deps["repos.page_repo", renderer: "renderers.markdown"]

        expose :page_content do |page|
          renderer.call(content: page.content)
        end

        expose :page_name do |page|
          page.name
        end

        expose :page_updated_at do |page|
          page.updated_at&.strftime("%m/%d/%Y")
        end

        private_expose :page do |slug:|
          page_repo.fetch!(slug: slug)
        end
      end
    end
  end
end
