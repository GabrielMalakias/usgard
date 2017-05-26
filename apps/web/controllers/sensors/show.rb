module Web::Controllers::Sensors
  class Show
    include Web::Action
    include ::AutoInject['commands.sensor.find_by_id']

    expose :sensor

    def call(params)
      @sensor = find_by_id.(params.get(:id))
    end
  end
end
