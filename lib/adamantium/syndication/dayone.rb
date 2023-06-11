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

      attr_reader :username, :password, :to, :from

      def call(name:, content:)
        Mail.defaults do
          delivery_method :smtp, {
            address: "smtp.fastmail.com",
            port: 587,
            authentication: "plain",
            tls: true,
            openssl_verify_mode: "peer"
          }
        end

        Mail.delivery_method.settings[:user_name] = username
        Mail.delivery_method.settings[:password] = password

        mail = Mail.new do
          subject name
          body content
        end

        mail[:to] = to
        mail[:from] = username

        mail.deliver
      end
    end
  end
end
