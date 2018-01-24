require 'spec_helper'

describe Usgard::Commands::Actuator::ListAll do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(ActuatorRepository) }
  let(:actuator) { double(Actuator) }

  describe '#call' do
    subject { instance.() }

    it 'delegates to the actuator repository' do
      expect(repository).to receive(:all).and_return([actuator])

      expect(subject).to eq([actuator])
    end
  end
end
