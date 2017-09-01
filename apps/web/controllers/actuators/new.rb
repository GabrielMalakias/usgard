module Web::Controllers::Actuators
  class New
    include Web::Action
    include Web::Authentication

    before :authenticate!

    def call(params)
    end
  end
end
