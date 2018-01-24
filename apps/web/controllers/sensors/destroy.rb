module Web::Controllers::Sensors
  class Destroy
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.sensors.destroy']

    before :authenticate!

    params do
      required(:id).filled(:str?)
    end

    def call(params)
      if params.valid?
        destroy.(params.get(:id))
      else
        halt 422
      end
    end
  end
end
