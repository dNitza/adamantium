require "pry"

module Adamantium
  module Actions
    module Posts
      class Handle < Action
        before :authenticate!

        include Deps[
          "settings",
          post_param_parser: "param_parser.micropub_post",
          create_resolver: "commands.posts.creation_resolver",
          delete_post: "commands.posts.delete",
          undelete_post: "commands.posts.undelete",
          update_post: "commands.posts.update",
          syndicate: "commands.posts.syndicate"
        ]

        def handle(req, res)
          req_entity = post_param_parser.call(params: req.params.to_h)
          action = req.params[:action]

          # delete, undelete, update
          if action
            operation, permission_check = resolve_operation(action)

            if permission_check.call(req)
              operation.call(params: req.params.to_h)
              res.status = 200
            else
              res.status = 401
            end
          elsif req_entity # create
            halt 401 unless verify_scope(req: req, scope: :create)

            command, contract = create_resolver.call(entry_type: req_entity).values_at(:command, :validation)

            validation = contract.call(req_entity.to_h)
            if validation.success?

              url = syndicate(validation.to_h) # TODO: set URL on post

              post = command.call(validation.to_h)

              res.status = 201
              res.headers.merge!(
                "Location" => "#{settings.micropub_site_url}/#{post.post_type}/#{post.slug}"
              )
            else
              res.body = {error: validation.errors.to_h}.to_json
              res.status = 422
            end
          end
        end

        private

        def resolve_operation(action)
          case action
          when "delete"
            [delete_post, ->(req) { verify_scope(req: req, scope: :delete) }]
          when "undelete"
            [undelete_post, ->(req) { verify_scope(req: req, scope: :undelete) }]
          when "update"
            [update_post, ->(req) { verify_scope(req: req, scope: :update) }]
          end
        end
      end
    end
  end
end
