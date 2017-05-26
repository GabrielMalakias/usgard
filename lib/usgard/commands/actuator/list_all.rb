module Usgard
  module Commands
    module Actuator
      class ListAll
        include ::AutoInject['actuators.repository']

        def call
          repository.all
        end
      end
    end
  end
end


