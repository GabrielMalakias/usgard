module Usgard
  module Commands
    module Actuator
      class Destroy
        include ::AutoInject['actuators.repository']

        def call(id, user_id:)
          repository.delete_by_id_and_user_id(id, user_id)
        end
      end
    end
  end
end
