# frozen_string_literal: true

require "securerandom"
require "dry/monads"
require "filemagic"
require "image_processing/vips"
require "open3"

module Adamantium
  module Commands
    module Media
      class Upload < Command
        include Deps["settings"]
        include Dry::Monads[:result]

        IMAGE_TYPES = %i[jpeg jpg png].freeze
        VIDEO_TYPES = %i[gif].freeze
        VALID_UPLOAD_TYPES = IMAGE_TYPES + VIDEO_TYPES

        def call(file:)
          mime = FileMagic.new
          type = mime.file(file[:tempfile].path, true).to_sym

          return Failure(:invalid_file_type) unless VALID_UPLOAD_TYPES.include? type

          save_image(file: file) if IMAGE_TYPES.include? type
          save_video(file: file) if VIDEO_TYPES.include? type
        end

        private

        def pathname
          Time.now.strftime("%m-%Y")
        end

        def uuid
          SecureRandom.uuid
        end

        def save_video(file:)
          fullsize_filename = "#{uuid}.mp4"

          dirname = File.join("public", "media", pathname)

          unless File.directory?(dirname)
            FileUtils.mkdir_p(dirname)
          end

          begin
            Open3.popen3("ffmpeg -i #{file[:tempfile].path} -movflags faststart -pix_fmt yuv420p -vf 'scale=trunc(iw/2)*2:trunc(ih/2)*2' #{File.join(dirname, fullsize_filename)}")
          rescue Errno::ENOENT, NoMethodError => e
            return Failure(e.message)
          end

          upload_path = File.join(settings.micropub_site_url, "/media/", "/#{pathname}/", fullsize_filename).to_s
          Success(upload_path)
        end

        def save_image(file:)
          fullsize_filename = "#{uuid}#{File.extname(file[:filename])}"
          thumbnail_filename = "#{uuid}-small#{File.extname(file[:filename])}"

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
