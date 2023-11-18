require "mail"

module Admin
  module Commands
    module Sessions
      class Create
        include Deps[
                  "repos.login_tokens_repo",
                  "repos.user_repo"
                ]

        def call(email:)
          app_settings = Admin::Container["settings"]
          user = user_repo.by_email(email: email)

          return unless user

          login_tokens_repo.delete_all

          token = login_tokens_repo.create(user_id: user.id, token: SecureRandom.uuid)

          Mail.defaults do
            delivery_method :smtp, {
              address: app_settings.smtp_server,
              port: 587,
              authentication: "plain",
              openssl_verify_mode: "peer",
              enable_starttls_auto: true
            }
          end

          Mail.delivery_method.settings[:user_name] = app_settings.smtp_username
          Mail.delivery_method.settings[:password] = app_settings.smtp_password

          mail = Mail.new do
            subject "Login to #{app_settings.site_name}"
            body "#{app_settings.micropub_site_url}/admin/login/#{token.token}"
          end

          mail[:to] = email
          mail[:from] = app_settings.from_email

          mail.deliver
        end
      end
    end
  end
end
