module Usgard
  module Commands
    module Actuator
      class Create
        include ::AutoInject['actuators.repository']

        def call(params)
          repository.create(params)
        end
      end
    end
  end
end

