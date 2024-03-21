require "que"

module Adamantium
  module Jobs
    class SaveEmailReply < Que::Job
      def run(message)
        webmentions_repo = Micropub::Container["repos.webmentions_repo"]
        post_repo = Micropub::Container["repos.post_repo"]
        settings = Micropub::Container["settings"]
        renderer = Micropub::Container["renderers.markdown"]

        mail = Mail::Message.new(message)

        return unless mail.subject == "About that post of yours"

        reply_content, in_reply_to = mail.body.decoded.split("---")
        post_url = URI.join(settings.micropub_site_url, in_reply_to.match(URI::DEFAULT_PARSER.make_regexp)[7]&.delete(")")).to_s

        slug = post_url.split("/").last
        post = post_repo.fetch!(slug)

        return unless post.commentable

        reply = {}
        reply[:type] = "reply"
        reply[:author_name] = mail.from.first
        reply[:published_at] = nil
        reply[:content_html] = renderer.call(content: reply_content)
        reply[:content_text] = reply_content
        reply[:source_url] = "email"
        reply[:target_url] = post_url
        reply[:post_id] = post.id

        webmentions_repo.create(reply)
      end
    end
  end
end
