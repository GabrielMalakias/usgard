
require 'spec_helper'

describe Usgard::Commands::Sensor::FindByVisibility do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(SensorRepository) }
  let(:sensor) { double(Sensor) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:params) do
        true
      end

      subject { instance.(params) }

      it 'delegates to the sensor repository' do
        expect(repository).to receive(:find_by_visibility).with(params).and_return([sensor])

        expect(subject).to eq([sensor])
      end
    end
  end
end
