module Usgard
  class Container
    extend Dry::Container::Mixin

    register('sensor.repository') do
      SensorRepository.new
    end

    register('commands.sensor.list_all') do
      Commands::Sensor::ListAll.new
    end

    register('commands.sensor.find_by_id') do
      Commands::Sensor::FindById.new
    end
  end
end

AutoInject = Dry::AutoInject(Usgard::Container)
