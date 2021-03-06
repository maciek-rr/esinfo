# frozen_string_literal: true

module Esinfo
  class Web
    module PageHelper
      def title
        "ESInfo"
      end

      def mount_path
        "/admin/esinfo"
      end

      def path(path)
        "#{mount_path}/#{path}"
      end

      def nav_classes(_path)
        if 1 # path == request.path_info
          "active"
        else
          ""
        end
      end

      def nav_panel_open(_section)
        true
      end
    end
  end
end
