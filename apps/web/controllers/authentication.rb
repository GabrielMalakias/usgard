module Web
  module Authentication
    def self.included(base)
      base.class_eval do
        expose :current_user
      end
    end

    def current_user
      @current_user ||= warden.user
    end

    def warden
      request.env['warden']
    end

    def authenticate!
      redirect_to routes.login_path if current_user.nil?
    end
  end
end

