require "httparty"

module Main
  module Queries
    module Blogroll
      class Index
        include Deps["settings"]

        def call
          resp = HTTParty.get("https://#{settings.rss_url}/api/greader.php/reader/api/0/subscription/list?output=json", {
            headers: {
              "Authorization" => "GoogleLogin auth=#{auth_token}"
            }
          })

          resp.body
        end

        private

        def auth_token
          auth_url = "https://#{settings.rss_url}/api/greader.php/accounts/ClientLogin?Email=#{settings.rss_username}&Passwd=#{settings.rss_password}"
          resp = HTTParty.get(auth_url)
          auth = resp.match(/SID=(.*)/)
          auth[1].strip
        end
      end
    end
  end
end
