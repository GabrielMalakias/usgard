require_relative '../authentication'

module Web::Controllers::Actuators
  class Create
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.actuators.create']

    before :authenticate!

    params do
      required(:actuator).schema do
        required(:name).filled(:str?)
        required(:description).filled(:str?)
        required(:topic).filled(:str?)
        required(:type).filled(:str?)
        required(:visible).filled(:bool?)
      end
    end

    def call(params)
      if params.valid?
        actuator = create.(create_params)

        redirect_to routes.actuator_path(id: actuator.id)
      else
        self.status = 422
      end
    end

    private

    def create_params
      params.get(:actuator).merge(user_id: current_user.id)
    end
  end
end
