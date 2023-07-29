# frozen_string_literal: true

Hanami.app.register_provider :post_utilities, namespace: true do
  start do
    register "slugify", Adamantium::SlugCreator.new
    register "link_finder", Adamantium::LinkFinder.new
    register "page_cacher", Adamantium::PageCacher.new
  end
end
