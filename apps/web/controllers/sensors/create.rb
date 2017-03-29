module Web::Controllers::Sensors
  class Create
    include Web::Action
    include ::AutoInject['commands.sensor.create']

    params do
      required(:sensor).schema do
        required(:name).filled(:str?)
        required(:mqtt_topic).filled(:str?)
      end
    end

    handle_exception ArgumentError => 422

    def call(params)
      if params.valid?
        sensor = create.(params.get(:sensor))

        redirect_to routes.sensor_url(id: sensor.id)
      else
        raise ::ArgumentError, params.errors
      end
    end
  end
end
