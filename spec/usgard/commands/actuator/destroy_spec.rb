require 'spec_helper'

describe Usgard::Commands::Actuator::Destroy do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(ActuatorRepository) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:user_id) { 1 }
      let(:params) do
        SecureRandom.uuid
      end

      subject { instance.(params, user_id: user_id) }

      it 'delegates the deletion to the actuator repository' do
        expect(repository)
          .to receive(:delete_by_id_and_user_id)
          .with(params, user_id).once

        subject
      end
    end
  end
end
