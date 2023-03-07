Hanami.app.register_provider :syndication, namespace: true do
  start do
    register "mastodon", Adamantium::Syndication::Mastodon.new
    register "pinboard", Adamantium::Syndication::Pinboard.new(api_key: target["settings"].pinboard_api_key)
    register "dayone", Adamantium::Syndication::Dayone.new(
      username: target["settings"].smtp_username,
      password: target["settings"].smtp_password,
      to: target["settings"].dayone_email,
      from: target["settings"].from_email
    )
  end
end
