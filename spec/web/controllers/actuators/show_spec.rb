require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/show'
require_relative '../../../../lib/usgard/commands/actuator/find_by_id'

describe Web::Controllers::Actuators::Show, type: :controller do
  let(:action) { described_class.new(find_by_id: find_by_id) }
  let(:actuator) { Actuator.new }
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
      allow(find_by_id).to receive(:call).with(id).and_return(actuator)
    end

    it 'status is 200' do
      response = action.call(params)

      expect(response[0]).to eq 200

      expect(action.exposures[:actuator]).to eq(actuator)
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
