require "dry/monads"

module Adamantium
  class WebmentionRequestParser
    include Dry::Monads[:result]

    def call(params:)
      case params[:"wm-property"]
      when "in-reply-to"
        Success[:reply, {
          type: "reply",
          author_name: params[:author][:name],
          author_photo: params[:author][:photo],
          author_url: params[:author][:url],
          published_at: params[:published],
          content_html: params[:content][:html],
          content_text: params[:content][:text],
          source_url: params[:url],
          target_url: params[:"in-reply-to"]
        }]
      when "like-of"
        Failure(:not_implemented)
      when "repost-of"
        Failure(:not_implemented)
      when "bookmark-of"
        Failure(:not_implemented)
      when "mention-of"
        Failure(:not_implemented)
      when "rsvp"
        Failure(:not_implemented)
      else
        Failure(:invalid_request)
      end
    end
  end
end
