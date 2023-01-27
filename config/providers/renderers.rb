# frozen_string_literal: true

Hanami.app.register_provider :renderers, namespace: true do
  start do
    register "markdown", Adamantium::Renderer::Markdown.new
  end
end
