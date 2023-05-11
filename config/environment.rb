require "uri"
require "pg"
require "connection_pool"
require "que"
require "hanami/boot"

uri = URI.parse(ENV['DATABASE_URL'])

Que.connection = ConnectionPool.new(size: 10) do
  PG::Connection.open(
    host:     uri.host,
    user:     uri.user,
    password: uri.password,
    port:     uri.port || 5432,
    dbname:   uri.path[1..-1]
  )
end