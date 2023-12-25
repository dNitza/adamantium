require "dry/monads"

module Adamantium
  class WebmentionRequestParser
    include Dry::Monads[:result]

    def call(params:)
      wm_params = params.to_h.fetch(:post, params)

      case wm_params[:"wm-property"]
      when "in-reply-to"
        Success[:reply, {
          type: "reply",
          author_name: wm_params[:author][:name],
          author_photo: wm_params[:author][:photo],
          author_url: wm_params[:author][:url],
          published_at: wm_params[:published],
          content_html: wm_params[:content][:html],
          content_text: wm_params[:content][:text],
          source_url: wm_params[:url],
          target_url: wm_params[:"in-reply-to"]
        }]
      when "like-of"
        Success[:like, {
          type: "like",
          author_name: wm_params[:author][:name],
          author_photo: wm_params[:author][:photo],
          author_url: wm_params[:author][:url],
          published_at: wm_params[:published],
          content_html: wm_params[:content][:html],
          content_text: wm_params[:content][:text],
          source_url: wm_params[:url],
          target_url: wm_params[:"in-reply-to"]
        }]
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
