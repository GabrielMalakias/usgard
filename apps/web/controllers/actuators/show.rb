module Web::Controllers::Actuators
  class Show
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.actuators.find_by_id']

    before :authenticate!

    expose :actuator

    def call(params)
      @actuator = find_by_id.(params.get(:id))

      halt 404 if @actuator.nil?
    end
  end
end

