module Adamantium
  class AuthenticatedAdminAction
    def self.call(action:)
      action_proc = ->(env) { Admin::Container["actions.#{action}"].call(env) }

      if Hanami.app.settings.basic_auth_username && Hanami.app.settings.basic_auth_password
        Rack::Auth::Basic.new(action_proc) do |username, password|
          username == Hanami.app.settings.basic_auth_username &&
            password == Hanami.app.settings.basic_auth_password
        end
      else
        Rack::Auth::Basic.new(action_proc) { |_username, _password| true }
      end
    end
  end
end
