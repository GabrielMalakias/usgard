module Web::Controllers::Sensors
  class Destroy
    include Web::Action
    include ::AutoInject['commands.sensors.destroy']

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
