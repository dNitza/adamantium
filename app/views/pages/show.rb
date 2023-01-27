module Adamantium
  module Views
    module Pages
      class Show < Adamantium::View
        include Deps[renderer: "renderers.markdown"]

        expose :page_content do |slug:|
          markdown_content = File.read("app/content/pages/#{slug}.md")

          renderer.call(content: markdown_content)
        rescue Errno::ENOENT
          renderer.call(content: "## Page not found")
        end
      end
    end
  end
end
