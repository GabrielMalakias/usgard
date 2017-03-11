module Usgard
  module Commands
    module Sensor
      class Create
        include ::AutoInject['sensors.repository']

        def call(params)
          repository.create(params.to_hash)
        end
      end
    end
  end
end
