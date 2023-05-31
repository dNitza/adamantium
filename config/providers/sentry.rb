require "sentry-ruby"

Hanami.app.register_provider :sentry, namespace: true do
  prepare do
    Sentry.init do |config|
      config.dsn = target["settings"].sentry_dsn
      config.traces_sample_rate = 0.25
    end
  end

  start do
    register "client", Sentry
  end
end
