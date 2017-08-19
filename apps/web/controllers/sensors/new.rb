module Web::Controllers::Sensors
  class New
    include Web::Action
    include Web::Authentication

    before :authenticate!

    def call(params)
    end
  end
end
