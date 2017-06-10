module Web::Controllers::Actuators
  class Update
    include Web::Action
    include ::AutoInject['commands.actuators.update', 'commands.actuators.find_by_id']

    params do
      required(:actuator).schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        required(:topic).filled(:str?)
        required(:type).filled(:str?)
        required(:visible).filled(:bool?)
      end
    end

    expose :actuator

    def call(params)
      @actuator = find_by_id.(params.get(:id))

      if params.valid?
        update.(params.get(:id), params.get(:actuator))

        redirect_to routes.actuator_url(id: params.get(:id))
      else
        self.status = 422
      end
    end
  end
end
