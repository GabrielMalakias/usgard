module Web::Views::Sensors
  class New
    include Web::View

    def form
      form_for :sensor, routes.sensors_path, class: 'form-horizontal' do
        div(class: 'form-group')  do
          label 'Name', class: 'col-sm-2 control-label'
          text_field :name, class: 'col-sm-10'
        end

        div(class: 'form-group')  do
          label 'Description', class: 'col-sm-2 control-label'
          text_area :description, class: 'col-sm-10'
        end

        div(class: 'form-group')  do
          label 'Mqtt Topic', class: 'col-sm-2 control-label'
          text_field :mqtt_topic, class: 'col-sm-10'
        end

        div(class: 'form-group')  do
          div(class: 'col-sm-offset-2 col-sm-10') do
            submit 'Create', class: 'btn btn-primary '
          end
        end
      end
    end
  end
end

