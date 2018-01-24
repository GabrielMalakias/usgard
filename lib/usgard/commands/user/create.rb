module Usgard
  module Commands
    module User
      class Create
        include ::AutoInject['users.repository', 'users.password']

        def call(params)
          repository.create(params)
        end

        private

        def build_params(params)
          {
            name: params[:name],
            email: params[:email],
            credentials: build_credentials_params(params[:password])
          }
        end

        def build_credentials_params(password)
          [{
            crypted_password: password.encrypt(password),
            provider: Usgard.to_s }]
        end
      end
    end
  end
end

