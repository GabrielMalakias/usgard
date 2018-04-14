require 'spec_helper'

describe Usgard::Commands::Actuator::FindById do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(ActuatorRepository) }
  let(:actuator) { double(Actuator) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:user_id) { 1 }
      let(:params) do
        SecureRandom.uuid
      end

      subject { instance.(params, user_id: user_id) }

      it 'delegates to the actuator repository' do
        expect(repository)
          .to receive(:find_by_id_and_user_id)
          .with(params, user_id).and_return(actuator)

        expect(subject).to eq(actuator)
      end
    end
  end
end
