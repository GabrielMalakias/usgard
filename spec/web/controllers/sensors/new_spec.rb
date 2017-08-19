require 'spec_helper'
require_relative '../../../../apps/web/controllers/sensors/new'

describe Web::Controllers::Sensors::New do
  let(:action) { described_class.new }

  let(:params) { Hash[] }

  context 'when calls the action' do
    it 'status is 200' do
      response = action.call(params)

      expect(response[0]).to eq 200
    end
  end
end
