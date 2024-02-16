module Main
  module Actions
    module Posts
      class TopTracks < Action
        include Deps["views.posts.top_tracks", query: "queries.posts.top_tracks"]

        def handle(req, res)
          res.content_type = "Application/JSON"
          res.status = 200
          tracks = query.call(slug: req.params[:slug])

          track = if tracks.is_a? Array
            tracks.first
          else
            tracks
          end

          if track
            res.render top_tracks, track: track
          end
        end
      end
    end
  end
end
