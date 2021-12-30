# frozen_string_literal: true

module Esinfo
  class Web
    ROOT = File.expand_path("../../web", __dir__)
    ASSETS = "#{ROOT}/assets"

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
      rules = []
      ::Rack::Builder.new do
        use Rack::Static, urls: ["/stylesheets", "/images", "/javascripts"], root: ASSETS, cascade: true,
                          header_rules: rules
        run Web::Application.new
      end
    end
  end
end
