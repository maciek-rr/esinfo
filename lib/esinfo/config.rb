# frozen_string_literal: true

module Esinfo
  module Config
    mattr_accessor :elasticsearch_client
    mattr_accessor :json_parser

    def self.json_parser
      @json_parser ||= JSON
    end
  end
end
