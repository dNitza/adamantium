require "mail"

module Adamantium
  module Syndication
    class Dayone
      def initialize(username:, password:)
        @username = username
        @password = password
      end

      def call(name:, content:)
        Mail.defaults do
          delivery_method :smtp, {
            address: "smtp.fastmail.com",
            port: 465,
            user_name: @username,
            password: @password,
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
