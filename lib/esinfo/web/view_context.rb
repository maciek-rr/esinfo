# frozen_string_literal: true

module Esinfo
  class Web
    class ViewContext
      def initialize
        @templates = {}
      end

      def content_for(template_name)
        @templates[template_name]
      end

      def add_template(template_name, content)
        @templates[template_name] = content
      end

      def get_binding
        binding
      end
    end
  end
end
