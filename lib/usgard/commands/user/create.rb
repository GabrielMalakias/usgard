module Usgard
  module Commands
    module User
      class Create
        include ::AutoInject['users.repository', 'commands.user.builder']

        def call(params)
          repository.create_with_credentials(build_params(params))
        end

        private

        def build_params(params)
          builder.(params)
        end
      end
    end
  end
end

