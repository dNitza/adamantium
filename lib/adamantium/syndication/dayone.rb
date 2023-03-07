require "mail"

module Adamantium
  module Syndication
    class Dayone
      include Deps["settings"]

      def call(name:, content:)
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
