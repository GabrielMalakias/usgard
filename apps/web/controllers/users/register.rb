require 'scrypt'

module Web::Controllers::Users
  class Register
    include Web::Action

    def call(params)
      user_params = params[:user]
      password = SCrypt::Password.create(user_params[:password])

      repo = UserRepository.new
      repo.create_with_credentials(
        email: user_params[:email],
        name: user_params[:name],
        credentials: [{ crypted_password: password, provider: 'self' }]
      )

      redirect_to '/'
    end
  end
end
