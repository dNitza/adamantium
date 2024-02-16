module Main
  module Actions
    module Pages
      class Show < Action
        include Deps["views.pages.show"]

        def handle(req, res)
          slug = req.params[:slug]

          res.status = File.exist?("slices/main/content/pages/#{slug}.md") ? 200 : 404
          res.render show, slug: slug
        end
      end
    end
  end
end
