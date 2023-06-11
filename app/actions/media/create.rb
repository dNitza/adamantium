module Adamantium
  module Actions
    module Media
      class Create < Action
        include Deps["commands.media.upload"]
        before :authenticate!

        def handle(req, res)
          data = req.params[:file]

          halt 401 unless verify_scope(req: req, scope: :create) || verify_scope(req: req, scope: :media)

          upload_result = upload.call(file: data)

          res.status = 422 if upload_result.failure?

          if upload_result.success?
            res.status = 201
            res.headers["Location"] = upload_result.value!
            res.headers["HX-Refresh"] = true
            res.body = {
              url: upload_result.value!
            }.to_json
          end
        end
      end
    end
  end
end
