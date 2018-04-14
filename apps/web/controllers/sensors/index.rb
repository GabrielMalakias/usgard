module Web::Controllers::Sensors
  class Index
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.sensors.list_all']

    before :authenticate!

    expose :sensors

    def call(params)
      @sensors = list_all.(user_id: current_user.id)
    end
  end
end
