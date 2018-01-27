require 'spec_helper'

describe Usgard::Commands::User::FindForAuth do

  describe '#call' do
    let(:instance) { described_class.new(email, password) }

    subject { instance.call }


    context 'when its a valid user' do
      let(:email) { 'usgard1@usgard.com' }
      let(:password) { 'inicial' }

      before do
        params = { name: 'Usgard', password: 'inicial', email: 'usgard1@usgard.com' }
        Usgard::Commands::User::Create.new.call(params)
      end

      it { is_expected.to_not be_nil }
    end

    context 'when its a invalid user' do
      let(:email) { 'usgard2@usgard.com' }
      let(:password) { 'inicial' }

      it { is_expected.to be_nil }
    end
  end
end

