module Web::Controllers::Sensors
  class Update
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.sensors.update', 'commands.sensors.find_by_id']

    before :authenticate!

    expose :sensor

    params do
      required(:id).filled

      required(:sensor).schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        required(:topic).filled(:str?)
        required(:visible).filled(:bool?)
      end
    end

    def call(params)
      @sensor = find_by_id.(params.get(:id))

      if params.valid? && !@sensor.nil?
        update.(params.get(:id), sensor_params(params))

        redirect_to routes.sensor_url(id: params.get(:id))
      else
        self.status = 422
      end
    end

    def sensor_params(params)
      @sensor_params ||= params.get(:sensor)
    end
  end
end
