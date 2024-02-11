require "time_math"

module Adamantium
  module Actions
    module Blogroll
      class Opml < Action
        include Deps["views.blogroll.opml"]

        def handle(req, res)
          res.content_type = "text/xml; charset=utf-8"
          res.render opml, format: :xml
        end
      end
    end
  end
end
