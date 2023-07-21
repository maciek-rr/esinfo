
require "bundler/setup"
Bundler.require
require 'rack'
require 'puma'

elasticsearch_url = ENV.fetch("ELASTICSEARCH_URL", "http://localhost:9200")
client = Elasticsearch::Client.new(log: true, url: elasticsearch_url)
Esinfo::Config.elasticsearch_client = client

# use Esinfo::Web::StaticRequest
app = Rack::Builder.new do
  files = Dir.glob("web/assets/**/*").each_with_object({}) do |file, mapping|
    next unless File.file?(file)

    short_file = file.sub("web/assets/", "")
    mapping[ "/admin/esinfo/#{short_file}"] = short_file
  end
  use Rack::Static, urls: files, root: "web/assets"
  run Esinfo::Web::Application.new
end

run app
