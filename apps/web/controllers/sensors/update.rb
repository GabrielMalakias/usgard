module Web::Controllers::Sensors
  class Update
    include Web::Action
    include ::AutoInject['commands.sensors.update', 'commands.sensors.find_by_id']

    params do
      required(:sensor).schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        required(:topic).filled(:str?)
        required(:visible).filled(:bool?)
      end
    end

    expose :sensor

    def call(params)
      @sensor = find_by_id.(params.get(:id))

      if params.valid?
        update.(params.get(:id), params.get(:sensor))

        redirect_to routes.sensor_url(id: params.get(:id))
      else
        self.status = 422
      end
    end
  end
end

