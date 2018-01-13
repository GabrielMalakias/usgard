module Usgard
  module Commands
    module User
      class Find
        include ::AutoInject['users.repository']

        def call(params)
          repository.create(params)
        end
      end
    end
  end
end

