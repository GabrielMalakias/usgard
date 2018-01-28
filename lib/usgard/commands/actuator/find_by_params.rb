module Usgard
  module Commands
    module Actuator
      class FindByParams
        include ::AutoInject['actuators.repository']

        def call(params, user_id:)
          repository
            .find_by_params(params.merge(user_id: user_id))
        end
      end
    end
  end
end
