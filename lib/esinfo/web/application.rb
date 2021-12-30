# frozen_string_literal: true

module Esinfo
  class Web
    class Application
      def call(_env)
        [200, {}, ["Hello, World!"]]
      end
    end
  end
end
