# frozen_string_literal: true

module Esinfo
  module Config
    class << self
      attr_accessor :elasticsearch_client
      attr_accessor :json_parser

      def json_parser
        @json_parser ||= JSON
      end
    end
  end
end
