require 'spec_helper'

describe Usgard::Commands::Actuator::FindById do
  let(:instance) { described_class.new(repository: repository }
  let(:repository) { double(ActuatorRepository) }
  let(:actuator) { double(Actuator) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:params) do
        SecureRandom.uuid
      end

      subject { instance.(params) }

      it 'delegates to the actuator repository' do
        expect(repository).to receive(:find).with(params).and_return(actuator)

        expect(subject).to eq(actuator)
      end
    end
  end
end
