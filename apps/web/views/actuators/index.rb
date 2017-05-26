module Web::Views::Actuators
  class Index
    include Web::View

    def edit_link(id)
      url = routes.edit_actuator_path(id: id)

      link_to(url, class: 'secondary-content') do
        html.i(class: 'material-icons grey-text text-darken-4') do
          'edit'
        end
      end
    end

    def show_link(id)
      url = routes.actuator_path(id: id)

      link_to(url, class: 'secondary-content') do
        html.i(class: 'material-icons teal-text text-darken-2') do
          'launch'
        end
      end
    end
  end
end
