# frozen_string_literal: true

Hanami.app.register_provider :param_parser, namespace: true do
  start do
    register "micropub_post", Adamantium::MicropubRequestParser.new
  end
end
