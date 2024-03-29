require "httparty"
require "que"
require "net/http"

module Adamantium
  module Jobs
    class ArchiveDeadBookmarks < Que::Job
      def run
        bookmark_repo = Admin::Container["repos.bookmark_repo"]

        bookmarks = bookmark_repo.list

        bookmarks.each do |bookmark|
          code = HTTParty.get(bookmark.url, follow_redirects: false).code
          if code >= 400
            bookmark_repo.update(id: bookmark.id, params: {url: "https://web.archive.org/web/*/#{bookmark.url}"})
          end
        rescue Net::OpenTimeout
          bookmark_repo.update(id: bookmark.id, params: {url: "https://web.archive.org/web/*/#{bookmark.url}"})
        end
      end
    end
  end
end
