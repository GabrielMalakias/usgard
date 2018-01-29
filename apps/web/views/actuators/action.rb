module Web::Views::Actuators
  module Action
   include Web::View

    def render_action(actuator)
      case actuator.type
      when ::Actuator::TYPES_TEXT
        text_action(actuator)
      when ::Actuator::TYPES_SWITCH
        switch_action(actuator)
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

    def switch_action(actuator)
      html.div(class: 'row')  do
       a(class: 'btn-floating', id: "console#{actuator.id}") do
          i(class: 'material-icons prefix') do
            'power_settings_new'
          end
        end

        span do
          i(class: 'material-icons prefix col s2 offset-s4', id: "switch#{actuator.id}") do
            'flash_off'
          end
        end
      end
    end
  end
end


