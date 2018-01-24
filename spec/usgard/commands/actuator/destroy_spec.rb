require 'spec_helper'

describe Usgard::Commands::Actuator::Destroy do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(ActuatorRepository) }

  describe '#call' do
    context 'when pass the correct params' do
      let(:params) do
        SecureRandom.uuid
      end

      subject { instance.(params) }

      it 'delegates the deletion to the actuator repository' do
        expect(repository).to receive(:delete).with(params).once

        subject
      end
    end
  end
end
