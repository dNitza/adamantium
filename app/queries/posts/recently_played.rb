require "httparty"
require "jwt"

module Adamantium
  module Queries
    module Posts
      class RecentlyPlayed
        include Deps["settings"]

        def call
          resp = HTTParty.get("https://api.music.apple.com/v1/me/recent/played", {
            headers: {
              "Authorization" => "Bearer #{jwt}",
              "Music-User-Token" => settings.apple_music_user_token
            }
          })

          resp.body
        end

        private

        def jwt
          authentication_payload = {
            iss: settings.apple_music_team,
            iat: Time.now.to_i,         # Issue date
            exp: Time.now.to_i + 3600   # Expiry of this token.
          }
          # The file we got from Apple
          apple_music_secret = File.read(File.join(Hanami.app.root, "config", "AuthKey_#{settings.apple_music_key}.p8"))
          private_key = OpenSSL::PKey::EC.new(apple_music_secret)

          JWT.encode(
            authentication_payload,
            private_key,
            "ES256",
            kid: settings.apple_music_key
          )
        end
      end
    end
  end
end
