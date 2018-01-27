module Usgard
  module Commands
    module Sensor
      class ListAll
        include ::AutoInject['sensors.repository']

        def call(user_id:)
          repository.find_by_user_id(user_id)
        end
      end
    end
  end
end


