# Be sure to restart your server when you modify this file.

Rails.application.config.session_store :cookie_store, key: '_youniverse_session'

# Youniverse::Application.config.session_store :redis_store, :servers => 'redis://redis-cluster-1.ofilpt.0001.sae1.cache.amazonaws.com:6379/0/cache'
# Youniverse::Application.config.session_store :redis_store,
#                                              :servers => {
# 		                                             :host => 'redis-cluster-1.ofilpt.0001.sae1.cache.amazonaws.com',
# 		                                             :port => 6379,
# 		                                             :db => 0,
# 		                                             :namespace => 'sessions'
#                                              }
