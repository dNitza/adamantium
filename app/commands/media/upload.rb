# frozen_string_literal: true

require "securerandom"
require "dry/monads"
require "filemagic"
require "image_processing/vips"

module Adamantium
  module Commands
    module Media
      class Upload < Command
        include Deps["settings"]
        include Dry::Monads[:result]

        VALID_UPLOAD_TYPES = %i[jpeg jpg png gif]

        def call(file:)
          mime = FileMagic.new
          type = mime.file(file[:tempfile].path, true)

          return Failure(:invalid_file_type) unless VALID_UPLOAD_TYPES.include? type.to_sym

          pathname = Time.now.strftime("%m-%Y")

          fullsize_filename = "#{SecureRandom.uuid}#{File.extname(file[:filename])}"
          thumbnail_filename = "#{SecureRandom.uuid}-small#{File.extname(file[:filename])}"

          dirname = File.join("public", "media", pathname)

          fullsize_pipeline = ImageProcessing::Vips.source(file[:tempfile])
            .resize_to_limit(1024, nil)
            .saver(quality: 100)
            .call(save: false)

          thumbnail_pipeline = ImageProcessing::Vips.source(file[:tempfile])
            .resize_to_limit(300, 300, crop: :attention)
            .saver(quality: 100)
            .call(save: false)

          unless File.directory?(dirname)
            FileUtils.mkdir_p(dirname)
          end

          begin
            fullsize_pipeline.write_to_file(File.join(dirname, fullsize_filename))
            thumbnail_pipeline.write_to_file(File.join(dirname, thumbnail_filename))
          rescue Errno::ENOENT, NoMethodError => e
            return Failure(e.message)
          end

          upload_path = File.join(settings.micropub_site_url, "/media/", "/#{pathname}/", fullsize_filename).to_s
          Success(upload_path)
        end
      end
    end
  end
end
