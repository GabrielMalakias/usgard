module Web::Controllers::Sensors
  class Index
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.sensors.list_all']

    before :authenticate!

    expose :sensors

    def call(params)
      @sensors = Array(list_all.())
    end
  end
end
