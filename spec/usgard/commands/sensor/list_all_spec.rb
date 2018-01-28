require 'spec_helper'

describe Usgard::Commands::Sensor::ListAll do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(SensorRepository) }
  let(:actuator) { double(Sensor) }

  describe '#call' do
    let(:user_id) { 1 }

    subject { instance.(user_id: user_id) }

    it 'delegates to the sensor repository' do
      expect(repository)
        .to receive(:find_by_user_id)
        .with(user_id)
        .and_return([actuator])

      expect(subject).to eq([actuator])
    end
  end
end
