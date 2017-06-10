module Web::Views::Sensors
  module EditForm
    def form
      form_for :sensor, routes.sensor_path(sensor.id), method: :patch, values: { sensor: sensor }, class: 'col s12' do
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
            'perm_data_setting'
          end

          label 'Topic', for: :topic
          text_field :topic, class: 'col-sm-10'
        end

        div(class: 'row input-field')  do
          p do
            check_box :visible, id: 'sensor-visible'
            label 'Visible', for: :visible
          end
        end

        div(class: 'row')  do
          div(class: 'input-field') do
            submit 'Update', class: 'btn teal darken-4 waves-effect waves-light'
          end
        end
      end
    end
  end
end
