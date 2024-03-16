Hanami.app.register_provider :clients, namespace: true do
  start do
    register "mastodon", Adamantium::Client::Mastodon.new
    register "blue_sky", Adamantium::Client::BlueSky.new
    register "omdb", Adamantium::Client::Omdb.new(api_key: target["settings"].omdb_api_key)
    register "gist", Adamantium::Client::Gist.new(token: target["settings"].gist_client_token)
    
    require "redis"
    register "redis", Redis.new
  end
end
