require 'spec_helper'

describe Usgard::Commands::User::Builder do
  let(:manager) { double(::Usgard::Commands::User::Password::Manager) }
  let(:instance) { described_class.new(manager: manager) }

  describe '#call' do
    let(:input) do
      { name: 'Gabriel', email: 'gabriel07malakias@gmail.com', password: '1234' }
    end
    let(:output) do
      { name: 'Gabriel', email: 'gabriel07malakias@gmail.com',
        credentials: [{ crypted_password: 'bla', provider: 'Usgard' }] }
    end

    before do
      allow(manager).to receive(:encrypt).and_return('bla')
    end

    subject { instance.call(input) }

    it { is_expected.to eq(output) }
  end
end
