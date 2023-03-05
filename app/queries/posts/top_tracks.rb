require "lastfm"
require "time_math"

module Adamantium
  module Queries
    module Posts
      class TopTracks
        include Deps["settings", "repos.post_repo"]

        def call(slug:)
          post = post_repo.fetch!(slug)

          lastfm = Lastfm.new(settings.lastfm_api_key, settings.lastfm_secret)

          lastfm.user.get_weekly_track_chart(user: "dNitza", from: TimeMath.week.floor(post.published_at).to_i, to: TimeMath.week.ceil(post.published_at).to_i)
        end
      end
    end
  end
end
