# frozen_string_literal: true

require "hanami/middleware/body_parser"
require_relative "authenticated_admin_action"

module Admin
  class Routes < Hanami::Routes
    use Hanami::Middleware::BodyParser, [:form, :json]

    Auth = Adamantium::AuthenticatedAdminAction

    get "/", to: Auth.(action: "index")

    get "/tags", to: Auth.(action: "tags.index")
    delete "/tags/:id", to: Auth.(action: "tags.delete")

    get "/tags/auto_tagging", to: Auth.(action: "auto_tagging.index")
    get "/tags/auto_tagging/new", to: Auth.(action: "auto_tagging.new")
    post "/tags/auto_tagging", to: Auth.(action: "auto_tagging.create")
    delete "/tags/auto_taggings/:id", to: Auth.(action: "auto_tagging.delete")

    get "/tags/merge", to: Auth.(action: "merge_tags.index")
    get "/tags/merge/:id", to: Auth.(action: "merge_tags.new")
    post "/tags/merge", to: Auth.(action: "merge_tags.merge")

    get "/bookmarks", to: Auth.(action: "bookmarks.index")
    delete "/bookmarks/:id", to: Auth.(action: "bookmarks.delete")
    post "/bookmarks/clean", to: Auth.(action: "bookmarks.clean")
    post "/bookmarks/cache/:id", to: Auth.(action: "bookmarks.cache")
    post "/bookmarks/:id/archive", to: Auth.(action: "bookmarks.archive")
    post "/bookmarks/:id/publish", to: Auth.(action: "bookmarks.publish")

    get "/posts", to: Auth.(action: "posts.index")
    delete "/posts/:id", to: Auth.(action: "posts.delete")
    post "/posts/:id/archive", to: Auth.(action: "posts.archive")
    post "/posts/:id/publish", to: Auth.(action: "posts.publish")
    get "/posts/:id", to: Auth.(action: "posts.show")
    post "/posts/:id/syndicate/:target", to: Auth.(action: "posts.syndicate")

    get "/media", to: Auth.(action: "photos.index")
    delete "/media/public/media/:year/:path", to: Auth.(action: "photos.delete")

    get "/trips", to: Auth.(action: "trips.index")
    get "/trips/:id", to: Auth.(action: "trips.show")
    post "/trips", to: Auth.(action: "trips.create")
    post "/trips/add_post", to: Auth.(action: "trips.add_post")
    post "/trips/remove_post", to: Auth.(action: "trips.remove_post")
    get "/trips/new", to: Auth.(action: "trips.new")
    post "/trips/:id", to: Auth.(action: "trips.update")
  end
end
