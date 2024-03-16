module Adamantium
  module ViewCache
    class FileStore
      def write(key:, content:, expiry:)
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
