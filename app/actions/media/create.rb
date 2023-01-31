module Adamantium
  module Actions
    module Media
      class Create < Action
        include Deps["commands.media.upload"]
        before :authorize!

        def handle(req, res)
          data = req.params[:file]

          halt 401 unless verify_scope(req: req, scope: :media)

          upload.call(file: data) do |m|
            m.failure do |v|
              res.status = 422
            end

            m.success do |v|
              res.status = 201
              res.headers["Location"] = v
              res.body = {
                url: v
              }.to_json
            end
          end
        end
      end
    end
  end
end
