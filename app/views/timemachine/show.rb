require "time_math"

module Adamantium
  module Views
    module Timemachine
      class Show < Adamantium::View
        include Deps[
          "repos.post_repo",
          "repos.movie_repo",
          "repos.podcast_scrobble_repo",
          "repos.trip_repo"
                ]

        expose :posts do |date|
          post_repo.posts_for_timemachine(date: date.value).map do |post|
            Decorators::Posts::Decorator.new(post)
          end
        end

        expose :bookmarks do |date|
          post_repo.bookmarks_for_timemachine(date: date.value).map do |post|
            Decorators::Bookmarks::Decorator.new(post)
          end
        end

        expose :podcasts do |date|
          podcast_scrobble_repo.for_timemachine(date: date.value)
        end

        expose :display_date do |date|
          date.strftime("%A, %d %B, %Y")
        end

        expose :next_date do |date|
          today_to_tomorrow = TimeMath.measure(TimeMath(date.value).advance(:day, +1).call, Time.now)

          unless today_to_tomorrow[:hours] < 0
            TimeMath.day.advance(date.value, +1)
              .strftime("%Y/%m/%d")
          end
        end

        expose :today do
          Time.now
            .strftime("%Y/%m/%d")
        end

        expose :current_date do |year:, month:, day:|
          "#{year}/#{month}/#{day}"
        end

        expose :prev_date do |date|
          TimeMath.day.advance(date.value, -1)
            .strftime("%Y/%m/%d")
        end

        expose :posts_by_month do
          post_tally = Hash.new(0)
          posts = post_repo.all_posts.each_with_object(post_tally) do |post, memo|
            memo[post.published_at.strftime("%Y/%m/%d")] += 1
          end

          podcast_scrobble_repo.listing.each do |scrobble|
            posts[scrobble.listened_at.strftime("%Y/%m/%d")] += 1
          end

          posts
        end

        private_expose :date do |year:, month:, day:|
          DateTime.parse("#{year}-#{month}-#{day}")
        end
      end
    end
  end
end
