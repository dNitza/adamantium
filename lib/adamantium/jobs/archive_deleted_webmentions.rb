require "httparty"
require "que"

module Adamantium
  module Jobs
    class ArchiveDeletedWebmentions < Que::Job
      def run
        webmention_repo = Admin::Container["repos.webmention_repo"]

        webmentions = webmention_repo.list_all_for_check

        webmentions.each do |webmention|
          code = HTTParty.get(webmention.source_url, follow_redirects: false).code

          # try and fetch the source at least 5 times, just in case a self-hosted server is down for a bit.
          if code >= 400
            if webmention.retrieval_attempts >= 5
              webmention_repo.update(webmention.id, published_at: nil)
            else
              webmention_repo.update(webmention.id, retrieval_attempts: (webmention.retrieval_attempts + 1))
            end
          end

          webmention_repo.update(webmention.id, last_checked_at: Time.now)
        end
      end
    end
  end
end
