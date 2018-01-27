module Usgard
  module Commands
    module Actuator
      class ListAll
        include ::AutoInject['actuators.repository']

        def call(user_id:)
          repository.all_by_user(user_id)
        end
      end
    end
  end
end


