module ActiveAdmin
  module Views
    module Pages
      
      class AbstractAction < Base

        def title
          params[:action].to_s.titleize
        end

        def main_content
          render(params[:action])
        end

      end
      
      
    end
  end
end
