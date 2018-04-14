require 'spec_helper'

describe Usgard::Commands::User::Create do
  let(:repository) { double(SensorRepository) }
  let(:manager) { double(Usgard::Commands::User::Password::Manager) }
  let(:builder) { Usgard::Commands::User::Builder.new(manager: manager) }
  let(:instance) { described_class.new(repository: repository, builder: builder) }

  describe '#call' do
    before do
      allow(manager).to receive(:encrypt).and_return('bla')
    end

    let(:input) do
      { name: 'Gabriel', email: 'usgard@usgard.com', password: '1234' }
    end
    let(:output) do
      { name: 'Gabriel', email: 'usgard@usgard.com',
        credentials: [{crypted_password: 'bla', provider: 'Usgard'}]}
    end

    subject { instance.call(input) }

   it 'delegates to repository' do
     expect(repository)
       .to receive(:create_with_credentials)
       .with(output).once

     subject
   end
  end
end

