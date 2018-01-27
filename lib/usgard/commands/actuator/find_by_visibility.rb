module Usgard
  module Commands
    module Actuator
      class FindByVisibility
        include ::AutoInject['actuators.repository']

        def call(user, visibility)
          repository.find_by_visibility(user.id, visibility)
        end
      end
    end
  end
end
