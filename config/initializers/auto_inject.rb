module Usgard
  class Container
    extend Dry::Container::Mixin

    register('sensors.repository') do
      SensorRepository.new
    end

    register('actuators.repository') do
      ActuatorRepository.new
    end

    register('users.repository') do
      UserRepository.new
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

    register('commands.sensors.find_by_params') do
      Commands::Sensor::FindByParams.new
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

    register('commands.actuators.find_by_params') do
      Commands::Actuator::FindByParams.new
    end

    register('commands.actuators.destroy') do
      Commands::Actuator::Destroy.new
    end

    register('commands.user.password.manager') do
      Commands::User::Password::Manager.new
    end

    register('commands.user.builder') do
      Commands::User::Builder.new
    end

    register('commands.user.create') do
      Commands::User::Create.new
    end

    register('mqtt.client') do
    end
  end
end

AutoInject = Dry::AutoInject(Usgard::Container)
