module Web::Controllers::Actuators
  class Show
    include Web::Action
    include ::AutoInject['commands.actuator.find_by_id']

    expose :actuator

    def call(params)
      @actuator = find_by_id.(params.get(:id))
    end
  end
end

