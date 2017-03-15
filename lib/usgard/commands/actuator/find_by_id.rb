module Usgard
  module Commands
    module Actuator
      class FindById
        include ::AutoInject['actuators.repository']

        def call(id)
          repository.find id
        end
      end
    end
  end
end

