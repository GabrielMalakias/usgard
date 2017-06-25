require 'spec_helper'
require_relative '../../../../apps/web/controllers/sensors/create'

describe Web::Controllers::Sensors::Create do
  let(:action) { described_class.new }

  context 'when is successful' do
    let(:params) do
      { sensor: { name: 'luminosity', description: 'This is the luminosity sensor', topic: 'luminosity', visible: true } }
    end

    it 'status is 302' do
      response = action.call(params)

      expect(response[0]).to eq 302
    end
  end

  context 'when is unprocessable' do
    let(:params) do
      Hash[]
    end

    it 'status is 422' do
      response = action.call(params)

      expect(response[0]).to eq 422
    end
  end
end
