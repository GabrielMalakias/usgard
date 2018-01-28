require 'spec_helper'

describe Usgard::Commands::Actuator::FindByParams do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(ActuatorRepository) }
  let(:actuator) { double(Actuator) }

  describe '#call' do
    context 'when filters by user_id and visible' do
      let(:user_id) { 1 }
      let(:params) do
        { visible: true }
      end

      subject { instance.(params, user_id: user_id) }

      it 'delegates to the actuator repository' do
        expect(repository)
          .to receive(:find_by_params)
          .with(params.merge(user_id: user_id))
          .and_return([actuator])

        expect(subject).to eq([actuator])
      end
    end
  end
end
