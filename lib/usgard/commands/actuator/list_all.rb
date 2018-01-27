module Usgard
  module Commands
    module Actuator
      class ListAll
        include ::AutoInject['actuators.repository']

        def call(user_id:)
          repository.find_by_user_id(user_id)
        end
      end
    end
  end
end


