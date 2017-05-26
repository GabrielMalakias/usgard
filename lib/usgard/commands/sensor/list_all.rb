module Usgard
  module Commands
    module Sensor
      class ListAll
        include ::AutoInject['sensors.repository']

        def call
          repository.all
        end
      end
    end
  end
end


