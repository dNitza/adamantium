module Admin
  module Views
    module Photos
      class Index < Admin::View
        MEDIA_DIR = "public/media/".freeze
        IGNORE_PATHS = ["podcast_art"].freeze

        expose :photos_buckets do |available_paths|
          available_paths.each_with_object({}) do |root, memo|
            memo[root[0].gsub(MEDIA_DIR, "")] = Dir["#{root[0]}/**"].sort { |a, b| File.ctime(b) <=> File.ctime(a) }
          end
        end

        private_expose :available_paths do
          Dir["#{MEDIA_DIR}*"]
            .map { |path| [path, path.split("-").reverse.join(" — ")] }
            .sort_by { |a| a[1] }
            .reverse
            .reject do |path|
            IGNORE_PATHS.any? { |ip| path[0].match(ip) }
          end
        end
      end
    end
  end
end
