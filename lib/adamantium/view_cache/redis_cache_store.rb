module Adamantium
  module ViewCache
    class RedisCacheStore
      include Deps["clients.redis"]

      def read(key:)
        cached_data = redis.get(key)

        JSON.parse(cached_data)["content"] if cached_data
      end

      def write(key:, content:, expiry:)
        redis.set(key, content, exat: expiry.to_i)
      end
    end
  end
end

