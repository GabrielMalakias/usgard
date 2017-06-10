module Web::Controllers::Sensors
  class Index
    include Web::Action
    include ::AutoInject['commands.sensors.list_all']

    expose :sensors

    def call(params)
      @sensors = Array(list_all.())
    end
  end
end
