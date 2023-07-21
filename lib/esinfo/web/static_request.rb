# frozen_string_literal: true

require "rack/utils"

module Esinfo
  class Web
    class StaticRequest
      FORMATS = %w[ico css png]

      def initialize(app)
        @app = app
      end

      def call(env)
        request = Rack::Request.new env
        if request.get? || request.head?
          path = clean_path(request.path_info)
          ext = ::File.extname(path)
          if ext && ext != ""
            content_type = ::Rack::Mime.mime_type(ext, nil)

            status, headers, body = @app.call(env)
            headers.merge!("Content-Type" => content_type)
            p headers
            return [status, headers, body]
          end
        end

        @app.call(env)
      end

      private

      def clean_path(path_info)
        path = ::Rack::Utils.unescape_path path_info.chomp("/")
        if ::Rack::Utils.valid_path? path
          ::Rack::Utils.clean_path_info path
        end
      end
    end
  end
end
