module Web::Controllers::Actuators
  class Destroy
    include Web::Action
    include ::AutoInject['commands.actuator.destroy']

    params do
      required(:id).filled(:str?)
    end

    def call(params)
      if params.valid?
        destroy.(params.get(:id))
      end
    end
  end
end

