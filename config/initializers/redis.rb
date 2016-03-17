require 'redis-namespace'
require 'sidekiq/middleware/i18n'

url = YAML.load_file("#{Rails.root}/config/redis.yml")[Rails.env]
uri = URI.parse(url)



REDIS = Redis.new(host: uri.host, port: uri.port, password: uri.password, thread_safe: true)

# # sidekiq configurations
# sidekiq_config = { url: url, driver: 'hiredis', namespace: 'komsuyapar' }
# Sidekiq.configure_server do |config|
#   config.redis = sidekiq_config
# end
# Sidekiq.configure_client do |config|
#   config.redis = sidekiq_config
# end
