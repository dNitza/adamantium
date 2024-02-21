module Main
  module Views
    module Blogroll
      class List < Main::View
        config.layout = false

        include Deps[blogroll_list: "queries.blogroll.index"]

        expose :blogroll do |blogroll_result|
          JSON.parse(blogroll_result)["subscriptions"].map do |feed|
            {
              title: feed["title"],
              url: feed["url"],
              html_url: feed["htmlUrl"],
              icon: feed["iconUrl"],
              categories: feed["categories"].map { |cat| cat["label"] }
            }
          end
        end

        private_expose :blogroll_result do
          blogroll_list.call
        end
      end
    end
  end
end
