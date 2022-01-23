# frozen_string_literal: true

module Esinfo
  class Web
    class ViewContext
      attr_reader :assigns

      def initialize(assigns: nil)
        @assigns = assigns || {}
        @templates = {}
        set_instance_variables
      end

      def content_for(template_name)
        @templates[template_name]
      end

      def add_template(template_name, content)
        @templates[template_name] = content
      end

      def public_binding
        binding
      end

      private

      def set_instance_variables
        assigns.each { |k, v| instance_variable_set("@#{k}", v) }
      end
    end
  end
end
