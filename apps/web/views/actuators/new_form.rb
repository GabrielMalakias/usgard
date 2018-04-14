module Web::Views::Actuators
  module NewForm
     def form
      form_for :actuator, routes.actuators_path, class: 'col s12' do
        div(class: 'row input-field')  do
          i(class: 'material-icons prefix') do
            'account_circle'
          end

          label 'Name', for: :name
          text_field :name, class: 'validate'
        end

        div(class: 'row input-field')  do
          i(class: 'material-icons prefix') do
            'comment'
          end

          label 'Description', for: :description
          text_area :description, class: 'materialize-textarea validate'
        end

        div(class: 'row input-field')  do
          i(class: 'material-icons prefix') do
            'mail'
          end

          label 'Topic', for: :topic
          text_field :topic, class: 'col-sm-10'
        end

        div(class: 'row input-field')  do
          p do
            check_box :visible, id: 'actuator-visible'
            label 'Visible', for: :visible
          end
        end

        div(class: 'row input-field') do
          p do
            radio_button :type, 'text', id: 'actuator-text-type'
            label 'Text', for: :text_type
          end

          p do
            radio_button :type, 'switch', id: 'actuator-switch-type'
            label 'Switch', for: :switch_type
          end
        end

        div(class: 'row')  do
          div(class: 'input-field') do
            submit 'Create', class: 'btn teal darken-4 waves-effect waves-light'
          end
        end
      end
    end
  end
end
