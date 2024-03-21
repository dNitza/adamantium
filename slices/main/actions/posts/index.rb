module Main
  module Actions
    module Posts
      class Index < Action
        include Deps["views.posts.index"]
        def handle(req, res)
          res.body = cache(key: "posts_index",
            params: [req.params[:q]],
            content_proc: ->(q) { index.call(context: Main::Views::Context.new(request: req), query: q) })
        end
      end
    end
  end
end
