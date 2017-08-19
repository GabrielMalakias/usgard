require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/destroy'

describe Web::Controllers::Actuators::Destroy do
  let(:action) { described_class.new }

  context 'when is successful' do
    let(:params) do
      { id: '10'}
    end

    it 'status is 200' do
      response = action.call(params)

      expect(response[0]).to eq 200
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
