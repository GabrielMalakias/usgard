require 'spec_helper'

describe Usgard::Commands::Actuator::Create do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(ActuatorRepository) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:params) do
        { name: 'Light Sensor' }
      end

      subject { instance.(params) }

      it 'delegates the creation to the actuator repository' do
        expect(repository).to receive(:create).with(params).once

        subject
      end
    end
  end
end
