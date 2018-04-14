module Web::Controllers::Sensors
  class Show
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.sensors.find_by_id']

    before :authenticate!

    expose :sensor

    def call(params)
      @sensor = find_by_id.(params.get(:id),
                            user_id: current_user.id)

      halt 404 if @sensor.nil?
    end
  end
end
