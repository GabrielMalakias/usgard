require 'scrypt'

module Web::Controllers::Users
  class Register
    include Web::Action
    include ::AutoInject['commands.user.create']

    def call(params)
      user_params = params[:user]

      create.(user_params)

      redirect_to '/'
    end
  end
end
