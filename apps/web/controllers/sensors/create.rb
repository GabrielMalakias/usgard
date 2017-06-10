module Web::Controllers::Sensors
  class Create
    include Web::Action
    include ::AutoInject['commands.sensors.create']

    params do
      required(:sensor).schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        required(:topic).filled(:str?)
        required(:visible).filled(:bool?)
      end
    end

    def call(params)
      if params.valid?
        sensor = create.(params.get(:sensor))

        redirect_to routes.sensor_url(id: sensor.id)
      else
        self.status = 422
      end
    end
  end
end
