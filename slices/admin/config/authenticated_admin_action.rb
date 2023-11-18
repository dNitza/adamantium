require "adamantium/middleware/authenticate"

module Adamantium
  class AuthenticatedAdminAction
    def self.call(action:)
      auth_proc = -> (id) { Admin::Container["repos.user_repo"].exists(id) }
      action_proc = ->(env) { Admin::Container["actions.#{action}"].call(env) }

      Adamantium::Middleware::Authenticate.new(action_proc, auth_proc)
    end
  end
end
