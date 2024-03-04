module Micropub
  module Actions
    module Posts
      class Handle < Action
        before :authenticate!

        include Deps[
          "settings",
          "commands.posts.create_entry",
          post_param_parser: "param_parser.micropub_post",
          delete_post: "commands.posts.delete",
          undelete_post: "commands.posts.undelete",
          update_post: "commands.posts.update",
          add_post_syndication_source: "commands.posts.add_syndication_source"
        ]

        def handle(req, res)
          req_entity = post_param_parser.call(params: req.params.to_h)
          action_type = req.params[:action]

          # delete, undelete, update
          if action_type
            case resolve_command(req: req, action_type: action_type)
            in Success[command]
              if command.call(params: req.params.to_h).success?
                res.status = 200
              else
                halt 400
              end
            in Failure[:not_permitted]
              halt 401
            end
          end

          # create
          if req_entity && verify_scope(req: req, scope: :create)
            Dry::Matcher::ResultMatcher.call(create_entry.call(req_entity: req_entity)) do |m|
              m.success do |post|
                res.headers["Location"] = "#{settings.micropub_site_url}/#{post.value!.post_type}/#{post.value!.slug}"
                res.status = 201
              end

              m.failure do |validation|
                res.body = {error: validation.errors.to_h}.to_json
                res.status = 422
              end
            end
          end
        end

        private

        def resolve_command(req:, action_type:)
          command, permission_check = commands(action_type)

          return Failure(:not_permitted) unless permission_check.call(req)

          Success(command)
        end

        def commands(action)
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
