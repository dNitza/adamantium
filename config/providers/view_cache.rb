Hanami.app.register_provider :view_cache, namespace: true do
  start do
    register "cacher", Adamantium::ViewCache::Cacher.new
  end
end
