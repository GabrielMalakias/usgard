module Usgard
  module Commands
    module Sensor
      class FindByVisibility
        include ::AutoInject['sensors.repository']

        def call(visibility)
          repository.find_by_visibility(visibility)
        end
      end
    end
  end
end
