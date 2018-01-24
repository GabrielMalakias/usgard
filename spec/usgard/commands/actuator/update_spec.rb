require 'spec_helper'

describe Usgard::Commands::Actuator::Update do
  let(:instance) { described_class.new(repository: repository }
  let(:repository) { double(ActuatorRepository) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:id) { SecureRandom.uuid }
      let(:params) do
        { name: 'Light Sensor' }
      end

      subject { instance.(id, params) }

      it 'delegates to the actuator repository' do
        expect(repository).to receive(:update).with(id, params).once

        subject
      end
    end
  end
end
