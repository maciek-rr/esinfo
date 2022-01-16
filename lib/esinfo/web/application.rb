# frozen_string_literal: true

module Esinfo
  class Web
    class Application
      def call(_env)
        [200, { "Content-Type" => "text/html" }, [template.to_s]]
      end

      private

      def template
        View.new(template: 'cluster/show', helpers: [PageHelper]).render
      end
    end
  end
end
