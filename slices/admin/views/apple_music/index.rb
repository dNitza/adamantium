require "jwt"

module Admin
  module Views
    module AppleMusic
      class Index < Admin::View
        include Deps["settings"]

        expose :developer_token do
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
            'ES256',
            kid: settings.apple_music_key
          )
        end
      end
    end
  end
end
