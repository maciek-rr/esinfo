# frozen_string_literal: true

module Esinfo
  class Probe
    def initialize; end

    def cluster_health
      Config.elasticsearch_client.cluster.health
    end
  end
end
