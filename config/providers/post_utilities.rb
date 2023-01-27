# frozen_string_literal: true

Hanami.app.register_provider :post_utilities, namespace: true do
  start do
    register "slugify", Adamantium::SlugCreator.new
  end
end
