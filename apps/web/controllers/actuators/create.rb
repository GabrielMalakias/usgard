module Web::Controllers::Actuators
  class Create
    include Web::Action
    include ::AutoInject['commands.actuator.create']

    params do
      required(:actuator).schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        required(:mqtt_topic).filled(:str?)
      end
    end


    def call(params)
      if params.valid?
        actuator = create.(params.get(:actuator))

        redirect_to routes.actuator_path(id: actuator.id)
      else
      end
    end
  end
end
