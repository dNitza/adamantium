module Admin
  module Repos
    class LoginTokensRepo < Adamantium::DB::Repo[:login_tokens]
      commands :create

      def by_token(token:)
        login_tokens.where(token: token).one
      end

      def delete_all
        login_tokens.delete
      end
    end
  end
end
