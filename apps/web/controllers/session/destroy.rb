module Web::Controllers::Session
  class Destroy
    include Web::Action
    include Web::Authentication

    def call(params)
      warden.logout

      redirect_to '/login'
    end
  end
end
