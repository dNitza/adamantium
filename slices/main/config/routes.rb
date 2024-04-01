module Main
  class Routes < Hanami::Routes
    root to: "site.home"
    get "/post/top_tracks/:slug", to: "posts.top_tracks"
    get "/post/:slug", to: "posts.show"
    get "/posts", to: "posts.index"
    # get "/posts/archive", to: "posts.archive"
    get "/posts/archive/:year", to: "posts.archive"

    get "/bookmarks", to: "bookmarks.index"
    get "/bookmarks/metadata/:id", to: "bookmarks.metadata"
    get "/bookmark/:slug", to: "bookmarks.show"

    get "/photos", to: "photos.index"
    get "/places", to: "places.index"
    get "/places/map", to: "places.map_page"
    get "/statuses", to: "statuses.index"

    get "/tags", to: "tags.index"
    get "/tagged/:slug", to: "tags.show"

    get "/key", to: "key.show" if Hanami.app.settings.micropub_pub_key

    get "/feeds/rss", to: "feeds.rss"
    get "/feeds/statuses_rss", to: "feeds.statuses_rss"

    get "/feeds/statuses_json", to: "feeds.statuses_json"

    get "/more", to: "more.index"

    get "/hikes", to: "workouts.index"
    post "/workouts", to: "workouts.create"

    get "/movies", to: "movies.index"

    get "/blogroll", to: "blogroll.index"
    get "/blogroll/list", to: "blogroll.list"
    get "/blogroll/opml", to: "blogroll.opml"

    get "/recently_played", to: "recently_played.index"
    get "/recently_played_games", to: "recently_played_games.index"
    get "/past_week", to: "past_week.index"

    get "/:slug", to: "pages.show"

    get "/trips", to: "trips.index"
    get "/trips/:id", to: "trips.show"

    get "/podcasts", to: "podcasts.index"

    get "/bookshelf", to: "books.index"

    get "/timemachine/:year/:month/:day", to: "timemachine.show"

    post "/posts/:slug/react", to: "posts.react"

    redirect "deploying-a-hanami-app-to-fly-io", to: "/post/deploying-a-hanami-20-app-to-flyio"
    redirect "deploying-a-hanami-app-to-fly-io/", to: "/post/deploying-a-hanami-20-app-to-flyio"
  end
end
