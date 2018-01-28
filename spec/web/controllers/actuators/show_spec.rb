require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/show'
require_relative '../../../../lib/usgard/commands/actuator/find_by_id'

describe Web::Controllers::Actuators::Show, type: :controller do
  let(:id) { '10' }
  let(:user) { instance_double(User, id: user_id) }
  let(:action) { described_class.new(find_by_id: find_by_id) }
  let(:user_id) { 1 }
  let(:actuator) { Actuator.new }
  let(:find_by_id) { double(Usgard::Commands::Actuator::FindById) }

  let(:params) do
    { id: id }
  end

  before do
    stub_current_user!(user)
  end

  context 'when has a result' do
    before do
      allow(find_by_id)
        .to receive(:call)
        .with(id, user_id: user_id)
        .and_return(actuator)
    end

    it 'status is 200' do
      response = action.call(params)

      expect(response[0]).to eq 200

      expect(action.exposures[:actuator]).to eq(actuator)
    end
  end

  context 'when is not found' do
    before do
      allow(find_by_id)
        .to receive(:call)
        .with(id, user_id: user_id)
        .and_return(nil)
    end

    it 'status is 404' do
      response = action.call(params)

      expect(response[0]).to eq 404
    end
  end
end
