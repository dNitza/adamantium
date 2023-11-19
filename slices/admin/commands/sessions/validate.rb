module Admin
  module Commands
    module Sessions
      class Validate
        include Deps["repos.login_tokens_repo"]

        def call(token:)
          token = login_tokens_repo.by_token(token: token)

          if (Time.now - token.created_at) > (15 * 60)
            login_tokens_repo.delete_all
            return nil
          end

          user_id = token.user_id

          if user_id
            user_id
          end
        end
      end
    end
  end
end