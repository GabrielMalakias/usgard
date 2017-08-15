module Web::Controllers::Actuators
  class Index
    include Web::Action
    include Web::Authentication
    include ::AutoInject['commands.actuators.list_all']

    before :authenticate!

    expose :actuators

    def call(params)
      @actuators = list_all.()
    end
  end
end
