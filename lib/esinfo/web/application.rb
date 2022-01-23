# frozen_string_literal: true

module Esinfo
  class Web
    class Application
      def call(_env)
        cluster_status
      end

      def cluster_status
        [200, { "Content-Type" => "text/html" }, [template("cluster/show", { cluster_health: cluster_health }).to_s]]
      end

      private

      def cluster_health
        p(1)
        probe.cluster_health
      rescue StandardError => e
        { error: e.message }
      end

      def probe
        @probe ||= Esinfo::Probe.new
      end

      def template(template, assigns)
        View.new(template: template, helpers: [PageHelper]).render(assigns: assigns)
      end
    end
  end
end
