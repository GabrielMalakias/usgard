require 'spec_helper'

describe Usgard::Commands::Sensor::ListAll do
  let(:instance) { described_class.new(repository: repository) }
  let(:repository) { double(SensorRepository) }
  let(:actuator) { double(Sensor) }

  describe '#call' do
    subject { instance.() }

    it 'delegates to the sensor repository' do
      expect(repository).to receive(:all).and_return([actuator])

      expect(subject).to eq([actuator])
    end
  end
e
