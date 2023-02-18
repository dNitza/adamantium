require "httparty"

module Adamantium
  module Commands
    module Posts
      class SendWebmentions
        include Deps["settings", "post_utilities.link_finder"]

        def call(post_content:, post_url:)
          source = post_url
          links = link_finder.call(post_content)
          links.each do |target|
            HTTParty.post(settings.webmention_service, {
              token: settings.webmention_token,
              source: source,
              target: target
            })
          end
        end
      end
    end
  end
end
