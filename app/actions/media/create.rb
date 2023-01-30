module Adamantium
  module Actions
    module Media
      class Create < Action
        include Deps["commands.media.upload"]

        def handle(req, res)
          data = req.params[:file]

          upload.call(file: data) do |m|
            m.failure do |v|
              res.status = 422
            end

            m.success do |v|
              res.status = 201
              res.headers["Location"] = v
              res.body = "OK"
            end
          end
        end
      end
    end
  end
end
