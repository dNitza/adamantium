module Micropub
  module Commands
    module Posts
      class CreateEntry < Adamantium::Command
        include Deps[
          "post_utilities.slugify",
          "repos.post_repo",
          create_resolver: "commands.posts.creation_resolver"
                ]

        def call(req_entity:)
          command, contract = create_resolver.call(entry_type: req_entity).values_at(:command, :validation)
          post_params = prepare_params(req_entity.to_h)
          validation = contract.call(post_params)

          if validation.success?
            post = command.call(validation.to_h)
            Success(post)
          else
            Failure(validation)
          end
        end

        private

        def prepare_params(post_params)
          post = post_params.to_h
          post[:slug] = post[:slug].empty? ? slugify.call(text: post[:name], checker: post_repo.method(:slug_exists?)) : post[:slug]
          post
        end
      end
    end
  end
end
