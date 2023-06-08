module Admin
  module Views
    module Photos
      class Index < Admin::View
        MEDIA_DIR = "public/media/".freeze

        expose :photos_buckets do
          Dir["#{MEDIA_DIR}*"].reverse.each_with_object({}) do |root, memo|
            memo[root.gsub(MEDIA_DIR, "")] = Dir["#{root}/**"]
          end
        end
      end
    end
  end
end
