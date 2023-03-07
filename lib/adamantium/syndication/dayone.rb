require "mail"

module Adamantium
  module Syndication
    class Dayone
      include Deps["settings"]

      def call(name:, content:)
        Mail.defaults do
          delivery_method :smtp, {
            address: "smtp.fastmail.com",
            port: 465,
            user_name: settings.smtp_username,
            password: settings.smtp_password,
            authentication: "plain",
            tls: true,
            openssl_verify_mode: "peer"
          }
        end

        Mail.deliver do
          to settings.dayone_email
          from settings.from_email
          subject name
          body content
        end
      end
    end
  end
end
