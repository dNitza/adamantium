require "json"

module Adamantium
  module ViewCache
    class Cacher
      def call(key:, content_proc:, expiry:)
        cached_content = read(key: key)

        return cached_content if cached_content

        rendered_content = content_proc.call

        data = JSON.generate(expire: expiry.to_i, content: rendered_content)

        write(key: key, content: data)

        rendered_content
      end

      private

      def write(key:, content:)
        filename = "#{key}.json"
        path = File.join(Hanami.app.root, "tmp", filename)

        File.write(path, content)
      end

      def read(key:)
        filename = "#{key}.json"
        path = File.join(Hanami.app.root, "tmp", filename)

        return nil unless File.exist?(path)

        cached_data = JSON.parse(File.read(path))

        if Time.strptime(cached_data["expire"].to_s, "%s") < Time.now
          File.delete(path)
          nil
        else
          cached_data["content"]
        end
      end
    end
  end
end
