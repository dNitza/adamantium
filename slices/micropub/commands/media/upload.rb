# frozen_string_literal: true

require "securerandom"
require "dry/monads"
require "filemagic"
require "image_processing/vips"
require "open3"

module Micropub
  module Commands
    module Media
      class Upload < Adamantium::Command
        include Deps["settings"]
        include Dry::Monads[:result]

        IMAGE_TYPES = %w[image/jpeg imag/jpg image/png].freeze
        VIDEO_TYPES = %w[image/gif video/mp4 video/mov].freeze
        AUDIO_TYPES = %w[audio/mp3 audio/mpeg audio/x-m4a].freeze
        VALID_UPLOAD_TYPES = IMAGE_TYPES + VIDEO_TYPES + AUDIO_TYPES

        def call(file:)
          mime = FileMagic.new
          mime.flags = [:mime_type]
          type = mime.file(file[:tempfile].path)
          return Failure(:invalid_file_type) unless VALID_UPLOAD_TYPES.include? type

          result = save_image(file: file) if IMAGE_TYPES.include? type
          result = save_video(file: file, type: type) if VIDEO_TYPES.include? type
          result = save_audio(file: file, type: type) if AUDIO_TYPES.include? type

          if result.success?
            Success(result.value!)
          else
            Failure()
          end
        end

        private

        def pathname
          Time.now.strftime("%m-%Y")
        end

        def uuid
          SecureRandom.uuid
        end

        def save_video(file:, type:)
          fullsize_filename = "#{uuid}.mp4"

          dirname = File.join("public", "media", pathname)

          unless File.directory?(dirname)
            FileUtils.mkdir_p(dirname)
          end

          begin
            case type
            when "image/gif"
              Open3.popen3("ffmpeg -i #{file[:tempfile].path} -movflags faststart -pix_fmt yuv420p -vf 'scale=trunc(iw/2)*2:trunc(ih/2)*2' #{File.join(dirname, fullsize_filename)}")
            when "video/mp4"
              Open3.popen3("ffmpeg -i #{file[:tempfile].path} -c:v libx265 -preset fast -crf 28 -tag:v hvc1 -c:a eac3 -b:a 224k #{File.join(dirname, fullsize_filename)}")
            when "video/mov"
              Open3.popen3("ffmpeg -i #{file[:tempfile].path} -c:v libx265 -preset fast -crf 28 -tag:v hvc1 -c:a eac3 -b:a 224k #{File.join(dirname, fullsize_filename)}")
            end
          rescue Errno::ENOENT, NoMethodError => e
            return Failure(e.message)
          end

          upload_path = File.join(settings.micropub_site_url, "/media/", "/#{pathname}/", fullsize_filename).to_s
          Success(upload_path)
        end

        def save_audio(file:, type:)
          filename = "#{uuid}.mp3"

          dirname = File.join("public", "media", pathname)

          unless File.directory?(dirname)
            FileUtils.mkdir_p(dirname)
          end

          begin
            Open3.popen3("ffmpeg -i #{file[:tempfile].path} -vn -ar 44100 -ac 2 -b:a 192k #{File.join(dirname, filename)}")
          rescue Errno::ENOENT, NoMethodError => e
            return Failure(e.message)
          end

          upload_path = File.join(settings.micropub_site_url, "/media/", "/#{pathname}/", filename).to_s
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
