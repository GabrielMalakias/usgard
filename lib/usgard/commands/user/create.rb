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
            credentials:           }
        end

        def build_credentials_params(params)
          [{
            crypted_password: password.encrypt(params[:password]),
             provider: Usgard.to_s }]
        end
      end
    end
  end
end

