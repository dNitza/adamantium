require "mail"

module Adamantium
  module Syndication
    class Dayone
      def initialize(username:, password:, to:, from:)
        @username = username
        @password = password
        @to = to
        @from = from
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

        mail = Mail.new do
          subject name
          body content
        end

        mail[:to] = @to
        mail[:from] = @username

        mail.deliver
      end
    end
  end
end
