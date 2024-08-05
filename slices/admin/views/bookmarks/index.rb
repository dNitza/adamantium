require "que"

module Admin
  module Views
    module Bookmarks
      class Index < Admin::View
        include Deps["repos.bookmark_repo"]

        expose :published_bookmarks do |bookmarks|
          bookmarks[0]
        end

        expose :unpublished_bookmarks do |bookmarks|
          bookmarks[1]
        end

        expose :bookmarks do
          bookmark_repo.list.partition { |p| p.published_at }
        end

        expose :running_jobs do
          Que.connection = Adamantium::Container["db.gateway"].connection
          Que.job_stats.any? { |job| job[:job_class] == Adamantium::Jobs::ArchiveDeadBookmarks.name }
        end
      end
    end
  end
end
