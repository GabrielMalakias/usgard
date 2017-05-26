module Usgard
  module Commands
    module Sensor
      class FindById
        include ::AutoInject['sensors.repository']

        def call(id)
          repository.find id
        end
      end
    end
  end
end


