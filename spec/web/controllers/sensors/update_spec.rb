require 'spec_helper'
require_relative '../../../../apps/web/controllers/sensors/update'
require_relative '../../../../lib/usgard/commands/sensor/update'
require_relative '../../../../lib/usgard/commands/sensor/find_by_id'

describe Web::Controllers::Sensors::Update, type: :controller do
  let(:action) { described_class.new(update: update, find_by_id: find_by_id) }
  let(:sensor) { Sensor.new }
  let(:id) { '10' }
  let(:update) { double(Usgard::Commands::Sensor::Update) }
  let(:find_by_id) { double(Usgard::Commands::Sensor::FindById) }

  before do
    stub_current_user!
  end

  context 'when has a result' do
    before do
      allow(find_by_id).to receive(:call).and_return(sensor)
    end

    context 'and params is valid' do
      let(:sensor_params) do
        {
          name: 'luminosity',
          description: 'This is the luminosity sensor',
          topic: 'luminosity',
          visible: true
        }
      end

      before do
        allow(update).to receive(:call).with(id, sensor_params).and_return(sensor)
      end

      it 'status is 302' do
        response = action.call(id: 10.to_s, sensor: sensor_params)

        expect(response[0]).to eq 302
      end
    end

    context 'and params is invalid' do
      let(:params) { { id: id } }

      it 'status is 422' do
        response = action.call(params)

        expect(response[0]).to eq 422
      end
    end
  end

  context 'when is not found' do
    let(:params) { { id: id } }

    before do
      allow(find_by_id).to receive(:call).and_return(nil)
    end

    it 'status is 422' do
      response = action.call(params)

      expect(response[0]).to eq 422
    end
  end
end
