module Usgard
  module Commands
    module Actuator
      class Update
        include ::AutoInject['actuators.repository']

        def call(id, params)
          repository.update(id, params)
        end
      end
    end
  end
end

