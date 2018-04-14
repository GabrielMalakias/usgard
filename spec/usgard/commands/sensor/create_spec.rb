require 'spec_helper'

describe Usgard::Commands::Sensor::Create do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(SensorRepository) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:params) do
        { name: 'Light Sensor' }
      end

      subject { instance.(params) }

      it 'delegates the creation to the sensor repository' do
        expect(repository).to receive(:create).with(params).once

        subject
      end
    end
  end
end
