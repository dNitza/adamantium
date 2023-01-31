module Adamantium
  module Actions
    module Media
      class Show < Action
        include Deps["settings"]

        def handle(req, res)
          res.body = if req.params[:q] == "source"
            {
              items: media_url(params[:file])
            }.to_json
          else
            "Micropub media endpoint"
          end

          res.status = 200
        end

        private

        def media_url(filename)
          pathname = Time.now.strftime("%m-%Y")

          File.join(settings.micropub_site_url, "/media/", "/#{pathname}/", filename).to_s
        end
      end
    end
  end
end
