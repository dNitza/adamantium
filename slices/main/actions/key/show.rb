module Main
  module Actions
    module Key
      class Show < Action
        include Deps["settings"]
        def handle(req, res)
          res.content_type = "text/plain"
          res.body = settings.micropub_pub_key
        end
      end
    end
  end
end
