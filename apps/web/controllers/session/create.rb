module Web::Controllers::Session
  class Create
    include Web::Action

    def auth_hash
      request.env["omniauth.auth"]
    end

    def call(params)
      user = auth_hash.uid

      warden.set_user user
      redirect_to '/'
    end

    def warden
      request.env['warden']
    end
  end
end
