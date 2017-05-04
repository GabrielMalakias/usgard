module Usgard
  module Commands
    module Actuator
      class Destroy
        include ::AutoInject['actuators.repository']

        def call(id)
          repository.delete id
        end
      end
    end
  end
end
