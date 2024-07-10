module Main
  module Actions
    module Posts
      class Show < Action
        include Deps["views.posts.show"]

        def handle(req, res)
          res.status = 200
          res.body = cache(key: "posts_show",
            params: [req.params[:slug]],
            content_proc: ->(slug) { show.call(context: Main::Views::Context.new(request: req), slug: slug) })
        end
      end
    end
  end
end
