module Admin
  module Commands
    module Sessions
      class Validate
        include Deps["repos.login_tokens_repo"]

        def call(token:)
          user_id = login_tokens_repo.by_token(token: token).user_id
          if user_id
            login_tokens_repo.delete_all
            user_id
          end
        end
      end
    end
  end
end