module Web::Views::Actuators
  module Action
    include Web::View

    def render_action(actuator)
      case actuator.type
      when 'text'
        text_action(actuator)
      when 'boolean'
        boolean_action(actuator)
      end
    end

    private

    def text_action(actuator)
      html.div(class: 'row input-field') do
        i(class: 'material-icons prefix') do
          'message'
        end
        input(class: 'validate', id: "console#{actuator.id}")
      end
    end

    def boolean_action(actuator)
      html.div(class: 'row')  do
        a(class: 'btn', id: "console#{actuator.id}") do
          i(class: 'material-icons prefix') do
            'power_settings_new'
          end
        end

        span do
          i(class: 'material-icons prefix', id: "switch#{actuator.id}") do
            'flash_off'
          end
        end
      end
    end
  end
end


