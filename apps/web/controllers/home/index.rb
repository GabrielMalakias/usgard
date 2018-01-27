module Web::Controllers::Home
  class Index
    include Web::Action
    include Web::Authentication
    include ::AutoInject[
      sensors_by_visibility: 'commands.sensors.find_by_visibility',
      actuators_by_visibility: 'commands.actuators.find_by_visibility']

    before :authenticate!

    expose :sensors
    expose :actuators

    def call(params)
      @sensors = sensors_by_visibility.(current_user, true)
      @actuators = actuators_by_visibility.(current_user, true)
    end
  end
end
