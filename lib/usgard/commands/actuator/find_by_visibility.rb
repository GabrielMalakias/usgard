module Usgard
  module Commands
    module Actuator
      class FindByVisibility
        include ::AutoInject['actuators.repository']

        def call(visibility)
          repository.find_by_visibility(visibility)
        end
      end
    end
  end
end
