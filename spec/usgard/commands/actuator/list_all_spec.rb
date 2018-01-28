require 'spec_helper'

describe Usgard::Commands::Actuator::ListAll do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(ActuatorRepository) }
  let(:actuator) { double(Actuator) }

  describe '#call' do
    let(:user_id) { 1 }

    subject { instance.(user_id: user_id) }

    it 'delegates to the actuator repository' do
      expect(repository)
        .to receive(:find_by_user_id)
        .with(user_id)
        .and_return([actuator])

      expect(subject).to eq([actuator])
    end
  end
end
