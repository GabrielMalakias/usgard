module Usgard
  module Commands
    module Sensor
      class Destroy
        include ::AutoInject['sensors.repository']

        def call(id)
          repository.delete id
        end
      end
    end
  end
end
