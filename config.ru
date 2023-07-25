
require "bundler/setup"
Bundler.require
require 'rack'
require 'puma'

elasticsearch_url = ENV.fetch("ELASTICSEARCH_URL", "http://localhost:9200")
client = Elasticsearch::Client.new(log: true, url: elasticsearch_url)
Esinfo::Config.elasticsearch_client = client

run Esinfo::Web
