require "json"

module Adamantium
  module ViewCache
    class Cacher
      include Deps["settings"]

      def call(key:, params:, content_proc:, expiry:)
        calculated_key = "adamantium:#{key}_#{params.join("_")}"
        cached_content = cache_store.read(key: calculated_key)

        return cached_content if cached_content

        rendered_content = content_proc.call(*params)

        data = JSON.generate(expire: expiry.to_i, content: rendered_content)

        cache_store.write(key: calculated_key, content: data, expiry: expiry)

        rendered_content
      end

      private

      def cache_store
        if settings.cache_store == :redis_cache_store
          RedisCacheStore.new
        else
          FileStore.new
        end
      end
    end
  end
end
