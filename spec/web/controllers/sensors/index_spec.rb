require 'spec_helper'
require_relative '../../../../apps/web/controllers/sensors/index'
require_relative '../../../../lib/usgard/commands/sensor/list_all'

describe Web::Controllers::Sensors::Index do
  let(:action) { described_class.new(list_all: list_all) }
  let(:all) { [Sensor.new, Sensor.new] }
  let(:id) { '10' }
  let(:list_all) { double(Usgard::Commands::Sensor::ListAll) }

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
