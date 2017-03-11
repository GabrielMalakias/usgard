module Web::Controllers::Actuators
  class Index
    include Web::Action
    include ::AutoInject['commands.actuator.list_all']

    expose :actuators

    def call(params)
      @actuators = list_all.()
    end
  end
end
