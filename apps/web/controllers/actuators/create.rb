module Web::Controllers::Actuators
  class Create
    include Web::Action
    include ::AutoInject['commands.actuators.create']

    def call(params)
      if params.valid?
        actuator = create.(params.get(:actuator))

        redirect_to routes.actuator_path(id: actuator.id)
      else
      end
    end
  end
end
