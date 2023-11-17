# frozen_string_literal: true

module Micropub
  module Actions
    module Webmentions
      class Create < Adamantium::Action
        include Deps["repos.webmentions_repo",
          "repos.post_repo",
          webmention_parser: "param_parser.webmention"
                ]

        def handle(req, res)
          webmention = webmention_parser.call(params: req.params)
          case webmention
          in Success[:reply, reply]
            slug = req.params[:"in-reply-to"].split("/").last
            post = post_repo.fetch!(slug)

            reply[:post_id] = post.id

            webmentions_repo.create(reply)
            res.status = 201
          in Failure(:invalid_request)
            res.status = 429
          in Failure(:not_implemented)
            res.status = 429
          end
        end
      end
    end
  end
end