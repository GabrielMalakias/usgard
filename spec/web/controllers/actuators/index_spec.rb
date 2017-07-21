require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/index'
require_relative '../../../../lib/usgard/commands/actuators/list_all'

describe Web::Controllers::Actuators::Index do
  let(:action) { described_class.new(list_all: list_all) }
  let(:all) { [Actuator.new, Actuator.new] }
  let(:id) { '10' }
  let(:list_all) { double(Usgard::Commands::Actuators::ListAll) }

  let(:params) { Hash[] }

  context 'when has a result' do
    before do
      allow(list_all).to receive(:call).and_return(all)
    end

    it 'status is 200' do
      response = action.call(params)

      expect(response[0]).to eq 200
    end
  end

end