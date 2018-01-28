module Web::Controllers::Home
  class Index
    include Web::Action
    include Web::Authentication
    include ::AutoInject[
      sensors_by_params: 'commands.sensors.find_by_params',
      actuators_by_params: 'commands.actuators.find_by_params']

    LIMIT_SENSORS_NUMBER = 6
    LIMIT_ACTUATORS_NUMBER = 6

    before :authenticate!

    expose :sensors
    expose :actuators

    def call(params)
      @sensors = find_sensors
      @actuators = find_actuators
    end

    private

    def find_sensors
      params = { visible: true, limit: LIMIT_SENSORS_NUMBER }
      sensors_by_params.(params, user_id: current_user.id)
    end

    def find_actuators
      params = { visible: true, limit: LIMIT_ACTUATORS_NUMBER }
      actuators_by_params.(params, user_id: current_user.id)
    end
  end
end
