module Web::Controllers::Sensors
  class Index
    include Web::Action
    include ::AutoInject['commands.sensor.list_all']

    expose :sensors

    def call(params)
      @sensors = list_all.()
    end
  end
end
