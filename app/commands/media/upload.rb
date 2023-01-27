# frozen_string_literal: true

module Adamantium
  module Commands
    module Media
      class Upload < Command
        include Deps["settings"]

        def call(file:)
          pathname = Time.now.strftime("%m-%Y")

          filename = file[:filename].split("/").last

          dirname = File.join("public", "media", pathname)

          unless File.directory?(dirname)
            FileUtils.mkdir_p(dirname)
          end

          begin
            File.write(File.join(dirname, filename), file[:tempfile].read)
          rescue Errno::ENOENT, NoMethodError => e
            return Failure(e.message)
          end

          upload_path = File.join(settings.micropub_site_url, "/media/", "/#{pathname}/", filename).to_s
          Success(upload_path)
        end
      end
    end
  end
end
