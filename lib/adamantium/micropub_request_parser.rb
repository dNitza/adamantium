require "securerandom"

module Adamantium
  class MicropubRequestParser
    include Deps["logger", "post_utilities.slugify", "repos.post_repo"]

    def call(params:)
      return nil if params.key?(:action)

      cont_type = content_type(params)
      req_type = request_type(params)
      req_params = parse_params(req_type, cont_type, params)

      if cont_type == :bookmark
        return Entities::BookmarkRequest.new(req_params)
      end

      Entities::PostRequest.new(req_params)
    end

    private

    def slug(name:, default_slug:)
      return default_slug if default_slug

      slugify.call(
        text: name,
        checker: post_repo.method(:slug_exists?)
      )
    end

    def content_type(params)
      return :bookmark if params[:"bookmark-of"]
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

    def parse_params(req_type, post_type, params)
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
      else
        new_params[:syndicate_to] = params[:"mp-syndicate-to"] || []
        new_params[:name] = params[:name]
        new_params[:slug] = params[:slug] || params["mp-slug"]
        new_params[:published_at] = (params[:"post-status"] == "draft") ? nil : publish_time
        new_params[:category] = params[:category].split(",") || []
        new_params[:photos] = params[:photo] || []

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
      new_params[:slug] = slug(name: new_params[:name], default_slug: params[:slug])

      logger.info(new_params)

      new_params
    end
  end
end
