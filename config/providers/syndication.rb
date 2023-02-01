Hanami.app.register_provider :syndication, namespace: true do
  start do
    register "mastodon", Adamantium::Syndication::Mastodon.new
    register "pinboard", Adamantium::Syndication::Pinboard.new(api_key: target["settings"].pinboard_api_key)
  end
end
