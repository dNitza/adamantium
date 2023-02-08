Hanami.app.register_provider :clients, namespace: true do
  start do
    register "mastodon", Adamantium::Client::Mastodon.new
  end
end
