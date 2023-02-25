module Adamantium
  class MicropubRequestParser
    def call(params:)
      return nil if params.key?(:action)

      cont_type = content_type(params)
      req_type = request_type(params)

      if cont_type == :bookmark
        req_params = parse_post_params(req_type, cont_type, params)
        return Entities::BookmarkRequest.new(req_params)
      end

      if cont_type == :checkin
        checkin_params = parse_checkin_params(params)
        return Entities::CheckinRequest.new(checkin_params)
      end

      req_params = parse_post_params(req_type, cont_type, params)
      Entities::PostRequest.new(req_params)
    end

    private

    def content_type(params)
      return :bookmark if params[:"bookmark-of"]
      return :checkin if params.dig(:properties, :checkin)
      :post
    end

    def request_type(params)
      if params[:h] == "entry"
        return :form
      end

      if params[:type]&.include?("h-entry")
        return :json
      end

      nil
    end

    def parse_post_params(req_type, post_type, params)
      new_params = {}
      new_params[:h] = "entry"
      new_params[:post_type] = post_type
      new_params[:action] = params[:action]

      publish_time = params[:published_at] || Time.now

      if req_type == :json
        new_params[:published_at] = (params[:"post-status"] == "draft") ? nil : publish_time
        new_params[:category] = params[:properties][:category] || []
        new_params[:name] = params[:properties][:name] && params[:properties][:name].first
        new_params[:content] = params[:properties][:content]&.first&.tr("\n", " ")
        new_params[:slug] = params[:slug] || params["mp-slug"]
        new_params[:syndicate_to] = params[:properties][:"mp-syndicate-to"] || []
        new_params[:photos] = params[:properties][:photo] || []
        new_params[:location] = params[:properties][:location]
      else
        new_params[:syndicate_to] = params[:"mp-syndicate-to"] || []
        new_params[:name] = params[:name]
        new_params[:slug] = params[:slug] || params["mp-slug"]
        new_params[:published_at] = (params[:"post-status"] == "draft") ? nil : publish_time
        new_params[:category] = params[:category] || []
        new_params[:photos] = if params[:photo].is_a?(String)
          {value: params[:photo], alt: ""}
        elsif params[:photo].nil?
          []
        else
          params[:photo]
        end
        new_params[:location] = params[:location]

        content = if params[:content]
          if params[:content].is_a?(Hash) && params[:content][:html]
            params[:content][:html]
          else
            params[:content]
          end
        end

        new_params[:content] = content
      end
      new_params[:url] = params[:"bookmark-of"]
      new_params[:slug] = params[:slug]

      new_params
    end

    def parse_checkin_params(params)
      new_params = {}

      checkin = params.dig(:properties, :checkin).first
      new_params[:h] = "entry"
      new_params[:syndication_sources] = params.dig(:properties, :syndication)
      new_params[:name] = checkin.dig(:properties, :name).first
      new_params[:content] = params.dig(:properties, :content)&.first || ""
      new_params[:url] = checkin.dig(:properties, :url)&.first
      new_params[:slug] = SecureRandom.uuid
      new_params[:category] = params.dig(:properties, :category)
      new_params[:published_at] = params.dig(:properties, :published)&.first
      new_params[:post_type] = :checkin
      location = params.dig(:properties, :location).first[:properties]
      new_params[:photos] = []
      new_params[:location] = "geo:#{location.dig(:latitude).first},#{location.dig(:longitude).first};u=0"
      new_params
    end
  end
end
