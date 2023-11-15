require "httparty"
require "que"

module Micropub
  module Commands
    module Posts
      class SendWebmentions
        include Deps["settings", "post_utilities.link_finder"]

        def call(post_content:, post_url:)
          Que.connection = Adamantium::Container["persistence.db"]

          Adamantium::Jobs::SendWebMentions.enqueue(post_content: post_content, post_url: post_url)
        end
      end
    end
  end
end
