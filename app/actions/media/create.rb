module Adamantium
  module Actions
    module Media
      class Create < Action
        before :authenticate!

        include Deps["commands.media.upload"]

        def handle(req, res)
          data = req.params[:file]

          halt 401 if verify_scope(req: req, scope: :media)

          upload.call(file: data) do |m|
            m.failure do |v|
              res.status = 422
            end

            m.success do |v|
              res.status = 201
              res.body = v
            end
          end
        end
      end
    end
  end
end
