module Usgard
  module Commands
    module User
      class Builder
        include ::AutoInject['commands.user.password.manager']

        def call(params)
          {
            name: params[:name],
            email: params[:email],
            credentials: build_credentials_params(params)
          }
        end

        private

        def build_credentials_params(params)
          [{ crypted_password: manager.encrypt(params[:password]), provider: Usgard.to_s }]
        end
      end
    end
  end
end


