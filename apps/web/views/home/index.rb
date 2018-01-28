require_relative '../actuators/action'

module Web::Views::Home
  class Index
    include Web::View
    include Web::Views::Actuators::Action

    def actuator_card(actuator)
      html.div(class: 'col s4 z-depth-1 card white') do
       div(class: 'card-content') do
          span(class: 'card-title activator') do
            span(id: "actuator#{actuator.id}", class: 'teal-text')
            i(class: 'material-icons teal-text text-darken-2 right') do
              'settings_ethernet'
            end
          end
          p do
            link_to(routes.actuator_path(id: actuator.id), class: 'grey-text darken-4-text') do
              actuator.name
            end
          end
        end

        div(class: 'card-reveal') do
          span(class: 'card-title teal-text') do
           i(class: 'material-icons teal-text text-darken-2 right') do
              'close'
            end
          end

          div(class: 'card-content') do
            render_action(actuator)
          end
        end
      end
    end

    def sensor_card(sensor)
      html.div(class: 'col s4 z-depth-1 white') do
        div(class: 'card-content') do
          span(class: 'card-title teal-text', id: "sensor#{sensor.id}") do
            " - "
          end

          p(class: 'grey-text darken-4-text') do
            link_to(routes.sensor_path(id: sensor.id), class: 'grey-text darken-4-text') do
              sensor.name
            end
          end
        end
      end
    end
  end
end
