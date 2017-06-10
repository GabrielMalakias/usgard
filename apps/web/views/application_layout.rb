module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def actuator_link
        link_to(routes.actuators_path) do
          html.i(class: 'material-icons') do
            'settings-remote'
          end
        end
      end
    end
  end
end
