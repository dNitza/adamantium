# frozen_string_literal: true

require "hanami/middleware/body_parser"
require "adamantium/middleware/basic_auth"

module Adamantium
  class Routes < Hanami::Routes
    use Hanami::Middleware::BodyParser, [:form, :json]
    # use Adamantium::Middleware::ProcessParams
    if Hanami.app.settings.basic_auth_username && Hanami.app.settings.basic_auth_password
      use Adamantium::Middleware::BasicAuth do |username, password|
        username == Hanami.app.settings.basic_auth_username &&
          password == Hanami.app.settings.basic_auth_password
      end
    end

    scope "micropub" do
      get "/", to: "site.config"
      post "/", to: "posts.handle"
      post "/media", to: "media.create"
      get "/media", to: "media.show"
    end

    get "/", to: "site.home"
    get "/post/top_tracks/:slug", to: "posts.top_tracks"
    get "/post/:slug", to: "posts.show"
    get "/posts", to: "posts.index"
    get "/posts/archive/:year", to: "posts.archive"

    get "/bookmarks", to: "bookmarks.index"
    get "/bookmarks/metadata/:id", to: "bookmarks.metadata"
    get "/bookmark/:slug", to: "bookmarks.show"

    get "/photos", to: "photos.index"
    get "/places", to: "places.index"
    get "/statuses", to: "statuses.index"

    get "/tags", to: "tags.index"
    get "/tagged/:slug", to: "tags.show"

    get "/key", to: "key.show" if Hanami.app.settings.micropub_pub_key

    get "/feeds/rss", to: "feeds.rss"
    get "/feeds/statuses_rss", to: "feeds.statuses_rss"

    get "/more", to: "more.index"

    get "/hikes", to: "workouts.index"
    post "/workouts", to: "workouts.create"

    get "/movies", to: "movies.index"

    get "/:slug", to: "pages.show"

    redirect "deploying-a-hanami-app-to-fly-io", to: "/post/deploying-a-hanami-20-app-to-flyio"
    redirect "deploying-a-hanami-app-to-fly-io/", to: "/post/deploying-a-hanami-20-app-to-flyio"

    slice :admin, at: "/admin" do
      get "/", to: "index"

      get "/tags", to: "tags.index"
      delete "/tags/:id", to: "tags.delete"

      get "/tags/auto_tagging", to: "auto_tagging.index"
      get "/tags/auto_tagging/new", to: "auto_tagging.new"
      post "/tags/auto_tagging", to: "auto_tagging.create"
      delete "/tags/auto_taggings/:id", to: "auto_tagging.delete"

      get "/bookmarks", to: "bookmarks.index"
      delete "/bookmarks/:id", to: "bookmarks.delete"
      post "/bookmarks/cache/:id", to: "bookmarks.cache"
      post "/bookmarks/:id/archive", to: "bookmarks.archive"

      get "/posts", to: "posts.index"
      delete "/posts/:id", to: "posts.delete"
      post "/posts/:id/archive", to: "posts.archive"
    end
  end
end
