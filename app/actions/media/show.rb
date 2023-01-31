module Adamantium
  module Actions
    module Media
      class Show < Action
        include Deps["settings", "logger"]

        def handle(req, res)
          logger.info("I am SHOW")

          res.body = if req.params[:q] == "source"
            {
              items: media_url(req.params[:file])
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
