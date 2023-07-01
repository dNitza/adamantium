module Admin
  module Actions
    module Photos
      class Delete < Admin::Action
        include Deps["commands.media.delete"]

        def handle(req, res)
          delete.call(path: File.join(Hanami.app.root, "public", "media", req.params[:year], req.params[:path]))
        end
      end
    end
  end
end
