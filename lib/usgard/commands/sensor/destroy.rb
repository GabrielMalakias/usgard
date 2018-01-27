module Usgard
  module Commands
    module Sensor
      class Destroy
        include ::AutoInject['sensors.repository']

        def call(id, user_id:)
          repository.delete_by_id_and_user_id(id, user_id)
        end
      end
    end
  end
end
