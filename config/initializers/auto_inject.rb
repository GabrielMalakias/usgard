module Usgard
  class Container
    extend Dry::Container::Mixin

    register('sensors.repository') do
      SensorRepository.new
    end

    register('actuators.repository') do
      ActuatorRepository.new
    end

    register('commands.sensors.list_all') do
      Commands::Sensor::ListAll.new
    end

    register('commands.sensors.create') do
      Commands::Sensor::Create.new
    end

    register('commands.sensors.update') do
      Commands::Sensor::Update.new
    end

    register('commands.sensors.find_by_id') do
      Commands::Sensor::FindById.new
    end

    register('commands.sensors.find_by_visibility') do
      Commands::Sensor::FindByVisibility.new
    end

    register('commands.sensors.destroy') do
      Commands::Sensor::Destroy.new
    end

    register('commands.actuators.list_all') do
      Commands::Actuator::ListAll.new
    end

    register('commands.actuators.update') do
      Commands::Actuator::Update.new
    end

    register('commands.actuators.create') do
      Commands::Actuator::Create.new
    end

    register('commands.actuators.find_by_id') do
      Commands::Actuator::FindById.new
    end

    register('commands.actuators.find_by_visibility') do
      Commands::Actuator::FindByVisibility.new
    end

    register('commands.actuators.destroy') do
      Commands::Actuator::Destroy.new
    end
  end
end

AutoInject = Dry::AutoInject(Usgard::Container)
