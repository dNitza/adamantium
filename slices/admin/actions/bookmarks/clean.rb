require "que"

module Admin
  module Actions
    module Bookmarks
      class Clean < Action
        def handle(req, res)
          Que.connection = Adamantium::Container["persistence.db"]

          res.status = 200
          if Que.job_stats.any? { |job| job[:job_class] == Adamantium::Jobs::RemoveDeadBookmarks.name }
            res.body = "Job already queued"
          else
            Adamantium::Jobs::RemoveDeadBookmarks.enqueue
            res.body = "#{Que.job_stats.count} job queued"
          end
        end
      end
    end
  end
end
