Hanami.app.register_provider :geo, namespace: true do
  start do
    register "gpx_parser", Adamantium::Geo::GpxParser.new
  end
end
