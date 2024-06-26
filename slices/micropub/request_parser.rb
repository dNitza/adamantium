module Micropub
  class RequestParser
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
      when :book
        book_params = parse_book_params(params)
        Entities::BookRequest.new(book_params)
      when :code
        code_params = parse_code_params(params)
        Entities::CodeRequest.new(code_params)
      else
        req_params = parse_post_params(req_type, cont_type, params)
        Entities::PostRequest.new(req_params)
      end
    end

    private

    def content_type(params)
      return :bookmark if params[:"bookmark-of"]
      return :book if params.dig(:properties, :"read-of")
      return :checkin if params.dig(:properties, :checkin)
      return :code if params.dig(:properties, :programming_language)
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

    def parse_code_params(params)
      new_params = {}
      new_params[:h] = "entry"
      new_params[:action] = params[:action]
      new_params[:content] = params[:properties][:content].first
      new_params[:slug] = SecureRandom.uuid
      new_params[:programming_language] = params[:properties][:programming_language]
      new_params[:published_at] = Time.now
      new_params[:post_type] = :code
      new_params[:name] = params[:properties][:name]&.first
      new_params[:syndicate_to] = Array(params[:properties][:"mp-syndicate-to"]) || []

      new_params
    end

    def parse_post_params(req_type, post_type, params)
      new_params = {}
      new_params[:h] = "entry"
      new_params[:post_type] = post_type
      new_params[:action] = params[:action]

      publish_time = params[:published_at] || Time.now

      new_params = if req_type == :json
        content = if params[:properties][:content]
          if params[:properties][:content].is_a?(Array) && params[:properties][:content].first.is_a?(Hash)
            params[:properties][:content].first[:html]
          else
            params[:properties][:content].first&.tr("\n", " ")
          end
        end
        photos = if params[:properties][:photo].is_a?(Array)
          params[:properties][:photo].map do |p|
            {value: p, alt: ""}
          end
        elsif params[:properties][:photo].is_a?(Hash)
          params[:properties][:photo]
        elsif params[:properties][:photo].is_a?(String)
          params[:properties][:photo].split(" ").map do |photo|
            {value: photo, alt: ""}
          end
        else
          []
        end

        new_params.merge({
          published_at: (params[:"post-status"] == "draft") ? nil : publish_time,
          category: params[:properties][:category] || [],
          name: params[:properties][:name]&.first,
          content: content,
          slug: params[:slug] || params[:"mp-slug"],
          syndicate_to: Array(params[:properties][:"mp-syndicate-to"]) || [],
          in_reply_to: params[:properties][:"in-reply-to"] || nil,
          emoji: params[:properties][:emoji] || nil,
          photos: photos,
          location: params[:properties][:location]
        })
      else
        photos = if params[:photo].is_a?(String)
          params[:photo].split(" ").map do |photo|
            {value: photo, alt: ""}
          end
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
          in_reply_to: params[:"in-reply-to"],
          emoji: params[:emoji],
          name: params[:name],
          slug: params[:slug] || params[:"mp-slug"],
          published_at: (params[:"post-status"] == "draft") ? nil : publish_time,
          category: (if params[:category].is_a?(Array)
                       params[:category]
                     elsif params[:category].is_a?(String)
                       params[:category].split(",")
                     else
                       []
                     end),
          photos: photos,
          location: params[:location],
          content: content
        })
      end
      new_params[:url] = params[:"bookmark-of"]
      new_params[:cache] = params[:cache] || false

      new_params
    end

    def parse_checkin_params(params)
      new_params = {}

      checkin = params.dig(:properties, :checkin).first
      new_params[:h] = "entry"
      new_params[:syndication_sources] = params.dig(:properties, :syndication) || []
      new_params[:name] = checkin.dig(:properties, :name).first
      new_params[:content] = params.dig(:properties, :content)&.first || ""
      new_params[:url] = checkin.dig(:properties, :url)&.first
      new_params[:slug] = SecureRandom.uuid
      new_params[:category] = params.dig(:properties, :category) || []
      published = DateTime.parse(params.dig(:properties, :published)&.first).new_offset(0)
      new_params[:published_at] = published.to_s
      new_params[:post_type] = :checkin

      location = if params.dig(:properties, :location)
        params.dig(:properties, :location).first[:properties]
      elsif checkin.dig(:properties, :latitude) && checkin.dig(:properties, :longitude)
        {latitude: checkin.dig(:properties, :latitude), longitude: checkin.dig(:properties, :longitude)}
      end

      new_params[:photos] = params.dig(:properties, :photo)&.map { |p| {value: p, alt: new_params[:name]} } || []
      new_params[:location] = "geo:#{location.dig(:latitude).first},#{location.dig(:longitude).first};u=0"
      new_params
    end

    def parse_book_params(params)
      new_params = {}
      new_params[:post_type] = "book"

      entry = params[:properties]
      new_params[:h] = "entry"
      new_params[:content] = entry[:summary].first
      new_params[:book_status] = entry[:"read-status"].first

      book = params.dig(:properties, :"read-of").first[:properties]
      new_params[:name] = book[:name].first
      new_params[:book_author] = book[:author].first
      new_params[:slug] = book[:uid].first
      new_params[:category] = []
      new_params[:published_at] = Time.now
      new_params
    end
  end
end
