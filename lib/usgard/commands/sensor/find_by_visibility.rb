module Usgard
  module Commands
    module Sensor
      class FindByVisibility
        include ::AutoInject['sensors.repository']

        def call(user, visibility)
          repository.find_by_visibility(user.id, visibility)
        end
      end
    end
  end
end
