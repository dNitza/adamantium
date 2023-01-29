Hanami.app.register_provider :syndication, namespace: true do
  start do
    register "mastodon", Adamantium::Syndication::Mastodon.new
  end
end
