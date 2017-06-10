module Usgard
  module Commands
    module Sensor
      class Update
        include ::AutoInject['sensors.repository']

        def call(id, params)
          repository.update(id, params)
        end
      end
    end
  end
end

