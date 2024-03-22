require "httparty"
require "que"

module Adamantium
  module Jobs
    class SendWebMentions < Que::Job
      def run(post_content:, post_url:, in_reply_to:)
        link_finder = Admin::Container["post_utilities.link_finder"]
        settings = Admin::Container["settings"]

        source = post_url
        links = link_finder.call(post_content)
        links.each do |target|
          HTTParty.post(URI(settings.webmention_url), {
            token: settings.webmention_token,
            source: source,
            target: target.to_s
          })
        end

        links = link_finder.call(in_reply_to)
        links.map do |target|
          puts [target.to_s, source]
          HTTParty.post(URI(settings.webmention_url), {
            token: settings.webmention_token,
            source: source,
            target: target.to_s
          })
        end
      end
    end
  end
end
