require "httparty"
require "que"

module Adamantium
  module Jobs
    class SendWebMentions < Que::Job
      def run(post_content:, post_url:)
        link_finder = Admin::Container["post_utilities.link_finder"]
        settings = Admin::Container["settings"]

        source = post_url
        links = link_finder.call(post_content)
        links.each do |target|
          HTTParty.post(settings.webmention_url, {
            token: settings.webmention_token,
            source: source,
            target: target
          })
        end
      end
    end
  end
end
