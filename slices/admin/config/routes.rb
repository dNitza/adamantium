# frozen_string_literal: true

require "hanami/middleware/body_parser"
require_relative "authenticated_admin_action"

module Admin
  class Routes < Hanami::Routes
    use Hanami::Middleware::BodyParser, [:form, :json]

    Auth = Adamantium::AuthenticatedAdminAction

    get "/", to: Auth.call(action: "index")

    get "/tags", to: Auth.call(action: "tags.index")
    delete "/tags/:id", to: Auth.call(action: "tags.delete")

    get "/tags/auto_tagging", to: Auth.call(action: "auto_tagging.index")
    get "/tags/auto_tagging/new", to: Auth.call(action: "auto_tagging.new")
    post "/tags/auto_tagging", to: Auth.call(action: "auto_tagging.create")
    delete "/tags/auto_taggings/:id", to: Auth.call(action: "auto_tagging.delete")

    get "/tags/merge", to: Auth.call(action: "merge_tags.index")
    get "/tags/merge/:id", to: Auth.call(action: "merge_tags.new")
    post "/tags/merge", to: Auth.call(action: "merge_tags.merge")

    get "/bookmarks", to: Auth.call(action: "bookmarks.index")
    delete "/bookmarks/:id", to: Auth.call(action: "bookmarks.delete")
    post "/bookmarks/clean", to: Auth.call(action: "bookmarks.clean")
    post "/bookmarks/cache/:id", to: Auth.call(action: "bookmarks.cache")
    post "/bookmarks/:id/archive", to: Auth.call(action: "bookmarks.archive")
    post "/bookmarks/:id/publish", to: Auth.call(action: "bookmarks.publish")

    get "/posts", to: Auth.call(action: "posts.index")
    delete "/posts/:id", to: Auth.call(action: "posts.delete")
    post "/posts/:id/archive", to: Auth.call(action: "posts.archive")
    post "/posts/:id/publish", to: Auth.call(action: "posts.publish")
    get "/posts/:id", to: Auth.call(action: "posts.show")
    post "/posts/:id/syndicate/:target", to: Auth.call(action: "posts.syndicate")

    get "/media", to: Auth.call(action: "photos.index")
    delete "/media/public/media/:year/:path", to: Auth.call(action: "photos.delete")

    get "/trips", to: Auth.call(action: "trips.index")
    get "/trips/:id", to: Auth.call(action: "trips.show")
    post "/trips", to: Auth.call(action: "trips.create")
    post "/trips/add_post", to: Auth.call(action: "trips.add_post")
    post "/trips/remove_post", to: Auth.call(action: "trips.remove_post")
    get "/trips/new", to: Auth.call(action: "trips.new")
    post "/trips/:id", to: Auth.call(action: "trips.update")
  end
end