module Web::Controllers::Actuators
  class Create
    include Web::Action
    include ::AutoInject['actuators.repository']

    def call(params)

    end
  end
end
