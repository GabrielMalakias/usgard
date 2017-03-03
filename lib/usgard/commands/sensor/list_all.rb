module Usgard
  module Commands
    module Sensor
      class ListAll
        include ::AutoInject['sensor.repository']

        def call
          repository.all
        end
      end
    end
  end
end


