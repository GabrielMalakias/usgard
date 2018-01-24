require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/edit'
require_relative '../../../../lib/usgard/commands/actuator/find_by_id'

describe Web::Controllers::Actuators::Edit, type: :controller do
  let(:action) { described_class.new(find_by_id: find_by_id) }
  let(:sensor) { Sensor.new }
  let(:id) { '10' }
  let(:find_by_id) { double(Usgard::Commands::Actuator::FindById) }

  let(:params) do
    { id: id }
  end

  before do
    stub_current_user!
  end

  context 'when has a result' do
    before do
      allow(find_by_id).to receive(:call).with(id).and_return(sensor)
    end

    it 'status is 200' do
      response = action.call(params)

      expect(response[0]).to eq 200
    end
  end

  context 'when is not found' do
    before do
      allow(find_by_id).to receive(:call).with(id).and_return(nil)
    end

    it 'status is 404' do
      response = action.call(params)

      expect(response[0]).to eq 404
    end
  end
end
