
require 'spec_helper'

describe Usgard::Commands::Sensor::FindByParams do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(SensorRepository) }
  let(:sensor) { double(Sensor) }

  describe '#call' do
    context 'when pass filters by user_id and visibility' do
      let(:user_id) { 1 }
      let(:params) do
        { visible: true }
      end

      subject { instance.(params, user_id: user_id) }

      it 'delegates to the sensor repository' do
        expect(repository)
          .to receive(:find_by_params)
          .with(params.merge(user_id: user_id))
          .and_return([sensor])

        expect(subject).to eq([sensor])
      end
    end
  end
end
