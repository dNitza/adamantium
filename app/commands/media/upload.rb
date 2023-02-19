# frozen_string_literal: true

require "securerandom"
require "dry/monads"
require "filemagic"

module Adamantium
  module Commands
    module Media
      class Upload < Command
        include Deps["settings"]
        include Dry::Monads[:result]

        VALID_UPLOAD_TYPES = %i[jpeg jpg png gif mp4]

        def call(file:)
          mime = FileMagic.new
          type = mime.file(file[:tempfile].path, true)

          return Failure(:invalid_file_type) unless VALID_UPLOAD_TYPES.include? type.to_sym

          pathname = Time.now.strftime("%m-%Y")

          filename = "#{SecureRandom.uuid}#{File.extname(file[:filename])}"

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
