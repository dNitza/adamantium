# frozen_string_literal: true

require "securerandom"

module Adamantium
  module Commands
    module Media
      class Upload < Command
        include Deps["settings", "logger"]

        def call(file:)
          pathname = Time.now.strftime("%m-%Y")

          filename = "#{SecureRandom.uuid}#{File.extname(file[:filename])}"

          dirname = File.join("public", "media", pathname)
          logger.info(dirname)
          logger.info(File.directory?(dirname))

          unless File.directory?(dirname)
            FileUtils.mkdir_p(dirname)
          end

          begin
            File.write(File.join(dirname, filename), file[:tempfile].read)
            logger.info("I WROTE")
          rescue Errno::ENOENT, NoMethodError => e
            logger.info("I FAILED to write - #{e}")
            return Failure(e.message)
          end

          upload_path = File.join(settings.micropub_site_url, "/media/", "/#{pathname}/", filename).to_s
          logger.info(upload_path)
          Success(upload_path)
        end
      end
    end
  end
end
