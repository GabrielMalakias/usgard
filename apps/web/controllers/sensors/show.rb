module Web::Controllers::Sensors
  class Show
    include Web::Action
    include ::AutoInject['commands.sensors.find_by_id']

    expose :sensor

    def call(params)
      @sensor = find_by_id.(params.get(:id))

      halt 404 if @sensor.nil?
    end
  end
end
