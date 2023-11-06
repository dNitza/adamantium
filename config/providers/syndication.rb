Hanami.app.register_provider :syndication, namespace: true do
  start do
    register "mastodon", Adamantium::Syndication::Mastodon.new
    register "blue_sky", Adamantium::Syndication::BlueSky.new
    register "raindrop", Adamantium::Syndication::Raindrop.new(api_key: "Bearer #{target["settings"].raindrop_api_key}")
    register "dayone", Adamantium::Syndication::Dayone.new(
      username: target["settings"].smtp_username,
      password: target["settings"].smtp_password,
      to: target["settings"].dayone_email,
      from: target["settings"].from_email
    )
  end
end
