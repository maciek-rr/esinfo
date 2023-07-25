# frozen_string_literal: true

module Esinfo
  class Web
    ROOT = File.expand_path("../../web", __dir__)
    ASSETS = "#{ROOT}/assets".freeze

    def self.call(env)
      new.call(env)
    end

    def call(env)
      app.call(env)
    end

    def app
      @app ||= build_app
    end

    private

    def build_app
      Rack::Builder.new do
        path = File.expand_path(File.dirname(__FILE__))
        files = Dir.glob(File.join(path, "..", "..", "web", "assets", "**", "*")).each_with_object({}) do |file, mapping|
          next unless File.file?(file)

          short_file = file.sub(/\A().+web\/assets\//, "")
          mapping["/admin/esinfo/#{short_file}"] = short_file
          mapping["/#{short_file}"] = short_file
        end
        use Rack::Static, urls: files, root: File.expand_path(File.join(path, "..", "..", "web/assets"))
        run Esinfo::Web::Application.new
      end
    end
  end
end
