module Main
  module Views
    class Context < Adamantium::Context
      include Deps["repos.page_repo"]

      def speculation_rules
        {"prerender": [
          {
            "where": {
              "and": [
                {"href_matches": "/*"},
              ]
            }
          }
        ],
        "prefetch": [
          {
            "urls": ["bookmarks", "posts", "photos", "statuses", "uses"],
            "referrer_policy": "no-referrer"
          }
        ]}.to_json
      end

      def pages
        page_repo.for_main_nav
      end

      def current_path
        request.fullpath
      end
    end
  end
end
