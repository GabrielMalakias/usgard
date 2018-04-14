require 'spec_helper'
require_relative '../../../../apps/web/controllers/sensors/destroy'

describe Web::Controllers::Sensors::Destroy, type: :controller do
  let(:user) { instance_double(User, id: user_id) }
  let(:action) { described_class.new }
  let(:user_id) { 1 }

  before do
    stub_current_user!(user)
  end

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
