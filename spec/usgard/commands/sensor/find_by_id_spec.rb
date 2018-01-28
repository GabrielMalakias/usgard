require 'spec_helper'

describe Usgard::Commands::Sensor::FindById do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(SensorRepository) }
  let(:sensor) { double(Sensor) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:user_id) { 1 }
      let(:params) do
        SecureRandom.uuid
      end

      subject { instance.(params, user_id: user_id) }

      it 'delegates to the sensor repository' do
        expect(repository)
          .to receive(:find_by_id_and_user_id)
          .with(params, user_id)
          .and_return([sensor])

        expect(subject).to eq([sensor])
      end
    end
  end
end
