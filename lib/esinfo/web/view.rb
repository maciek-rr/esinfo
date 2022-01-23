# frozen_string_literal: true

module Esinfo
  class Web
    class View
      ROOT = File.join(Esinfo::Web::ROOT, "views")

      def initialize(template:, layout: "application", helpers: [])
        @template = template
        @layout = layout
        @helpers = helpers
      end

      def render(assigns: {})
        template_erb = ERB.new(template_content)
        template_html = template_erb.result(render_context(assigns).public_binding)

        ctx = render_context
        ctx.add_template(:template, template_html)

        layout_erb = ERB.new(layout_content)
        layout_erb.result(ctx.public_binding)
      end

      private

      attr_reader :template, :layout, :helpers

      def render_context(assigns = nil)
        render_context = ViewContext.new(assigns: assigns)
        helpers.each { |helper| render_context.class.send(:include, helper) }
        render_context
      end

      def layout_content
        File.read(File.join(ROOT, "#{layout}.html.erb"))
      end

      def template_content
        return unless template

        File.read(File.join(ROOT, "#{template}.html.erb"))
      end
    end
  end
end
