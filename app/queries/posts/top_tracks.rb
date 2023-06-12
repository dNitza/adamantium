require "lastfm"
require "time_math"

module Adamantium
  module Queries
    module Posts
      class TopTracks
        include Deps["settings", "repos.post_repo", "repos.top_track_repo"]

        def call(slug:)
          post = post_repo.fetch!(slug)
          start_date = TimeMath.week.floor(post.published_at).to_i
          end_date = TimeMath.week.ceil(post.published_at).to_i

          top_tracks = top_track_repo.for_post(id: post.id)

          return top_tracks unless top_tracks.empty?

          lastfm = Lastfm.new(settings.lastfm_api_key, settings.lastfm_secret)

          tracks = lastfm.user.get_weekly_track_chart(user: "dNitza", from: start_date, to: end_date)

          track = if tracks.is_a? Array
                    tracks.first
                  else
                    tracks
                  end

          if track
            mb_id = track["mbid"] == {} ? "unknown" : track["mbid"]
            top_track_repo.upsert(post_id: post.id, name: track["name"], artist: track.dig("artist", "content"), url: track["url"], mb_id: mb_id)
          end

          top_track_repo.for_post(id: post.id)
        end
      end
    end
  end
end
