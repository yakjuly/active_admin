module ActiveAdmin
  module ViewHelpers
    module BreadcrumbHelper

      # Returns an array of links to use in a breadcrumb
      def breadcrumb_links(path = nil)
        path ||= request.fullpath
        parts = path.gsub(/^\//, '').split('/')
        parts.pop unless %w{ create update }.include?(params[:action])
        crumbs = []
        parts.each_with_index do |part, index|
          name = ""
          if part =~ /^\d/ && parent = parts[index - 1]
            begin
              parent_class = parent.singularize.camelcase.constantize
              obj = parent_class.find(part.to_i)
              name = obj.display_name if obj.respond_to?(:display_name)
            rescue
            end
          end
          name = part.titlecase if name == ""
          i18n_name = name.match(/^\d+$/) ? name : t(name, :scope => "menu")
          crumbs << link_to(i18n_name, "/" + parts[0..index].join('/'))
        end
        crumbs
      end

    end
  end
end
