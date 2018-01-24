require 'spec_helper'

describe Usgard::Commands::Sensor::Destroy do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(SensorRepository) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:params) do
        SecureRandom.uuid
      end

      subject { instance.(params) }

      it 'delegates to the sensor repository' do
        expect(repository).to receive(:delete).with(params).once

        subject
      end
    end
  end
end
