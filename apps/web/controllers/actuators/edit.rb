module Web::Controllers::Actuators
  class Edit
    include Web::Action
    include ::AutoInject['commands.actuators.find_by_id']

    expose :actuator

    def call(params)
      @actuator = find_by_id.(params.get(:id))

      halt 404 if @actuator.nil?
    end
  end
end


