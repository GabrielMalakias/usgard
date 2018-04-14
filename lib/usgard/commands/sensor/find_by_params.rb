module Usgard
  module Commands
    module Sensor
      class FindByParams
        include ::AutoInject['sensors.repository']

        def call(params, user_id:)
          repository
            .find_by_params(params.merge(user_id: user_id))
        end
      end
    end
  end
end
