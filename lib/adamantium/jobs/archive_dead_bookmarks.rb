require "httparty"
require "que"

module Adamantium
  module Jobs
    class ArchiveDeadBookmarks < Que::Job
      def run
        bookmark_repo = Admin::Container["repos.bookmark_repo"]

        bookmarks = bookmark_repo.list

        bookmarks.each do |bookmark|
          code = HTTParty.get(bookmark.url, follow_redirects: false).code
          if code >= 400
            bookmark_repo.update(bookmark.id, {url: "https://web.archive.org/web/*/#{bookmark.url}"})
          end
        end
      end
    end
  end
end
