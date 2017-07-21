require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/new'

describe Web::Controllers::Actuators::New do
  let(:action) { described_class.new }

  let(:params) { Hash[] }

  context 'when calls the action' do
    it 'status is 200' do
      response = action.call(params)

      expect(response[0]).to eq 200
    end
  end
end
