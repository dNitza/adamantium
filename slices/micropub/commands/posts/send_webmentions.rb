require "httparty"
require "que"

module Micropub
  module Commands
    module Posts
      class SendWebmentions
        include Deps["settings", "post_utilities.link_finder"]

        def call(post_content:, post_url:, in_reply_to:)
          Que.connection = Adamantium::Container["db.gateway"].connection

          Adamantium::Jobs::SendWebMentions.enqueue(post_content: post_content, post_url: post_url, in_reply_to: in_reply_to)
        end
      end
    end
  end
end
