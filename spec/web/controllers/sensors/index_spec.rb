require 'spec_helper'
require_relative '../../../../apps/web/controllers/sensors/index'
require_relative '../../../../lib/usgard/commands/sensor/list_all'

describe Web::Controllers::Sensors::Index, type: :controller do
  let(:id) { '10' }
  let(:all) { [Sensor.new, Sensor.new] }
  let(:user) { instance_double(User, id: user_id) }
  let(:action) { described_class.new(list_all: list_all) }
  let(:user_id) { 1 }
  let(:list_all) { double(Usgard::Commands::Sensor::ListAll) }

  let(:params) { Hash[] }

  before do
    stub_current_user!(user)
  end

  context 'when has a result' do
    before do
      allow(list_all)
        .to receive(:call)
        .with(user_id: user_id)
        .and_return(all)
    end

    it 'status is 200' do
      response = action.call(params)

      expect(response[0]).to eq 200
    end
  end
end
