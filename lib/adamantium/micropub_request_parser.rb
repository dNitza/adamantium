module Adamantium
  class MicropubRequestParser
    def call(params:)
      return nil if params.key?(:action)

      cont_type = content_type(params)
      req_type = request_type(params)

      case cont_type
      when :bookmark
        req_params = parse_post_params(req_type, cont_type, params)
        Entities::BookmarkRequest.new(req_params)
      when :checkin
        checkin_params = parse_checkin_params(params)
        Entities::CheckinRequest.new(checkin_params)
      else
        req_params = parse_post_params(req_type, cont_type, params)
        Entities::PostRequest.new(req_params)
      end
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

      new_params = if req_type == :json
        new_params.merge({
          published_at: (params[:"post-status"] == "draft") ? nil : publish_time,
          category: params[:properties][:category] || [],
          name: params[:properties][:name]&.first,
          content: params[:properties][:content]&.first&.tr("\n", " ") || "",
          slug: params[:slug] || params[:"mp-slug"],
          syndicate_to: Array(params[:properties][:"mp-syndicate-to"]) || [],
          photos: params[:properties][:photo] || [],
          location: params[:properties][:location]
        })
      else
        photos = if params[:photo].is_a?(String)
          {value: params[:photo], alt: ""}
        elsif params[:photo].nil?
          []
        else
          params[:photo]
        end

        content = if params[:content]
          if params[:content].is_a?(Hash) && params[:content][:html]
            params[:content][:html]
          else
            params[:content]
          end
        end

        new_params.merge({
          syndicate_to: Array(params[:"mp-syndicate-to"]) || [],
          name: params[:name],
          slug: params[:slug] || params[:"mp-slug"],
          published_at: (params[:"post-status"] == "draft") ? nil : publish_time,
          category: params[:category] || [],
          photos: photos,
          location: params[:location],
          content: content
        })
      end
      new_params[:url] = params[:"bookmark-of"]

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
      published = DateTime.parse(params.dig(:properties, :published)&.first).new_offset(0)
      new_params[:published_at] = published.to_s
      new_params[:post_type] = :checkin
      location = params.dig(:properties, :location).first[:properties]
      new_params[:photos] = params.dig(:properties, :photo)&.map { |p| {value: p, alt: new_params[:name]} } || []
      new_params[:location] = "geo:#{location.dig(:latitude).first},#{location.dig(:longitude).first};u=0"
      new_params
    end
  end
end
