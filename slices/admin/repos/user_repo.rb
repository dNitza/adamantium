module Admin
  module Repos
    class UserRepo < Adamantium::DB::Repo[:users]
      commands :create

      def exists(id)
        !!users
          .where(id: id)
          .one
      end

      def by_email(email:)
        users.where(email: email).one
      end
    end
  end
end
