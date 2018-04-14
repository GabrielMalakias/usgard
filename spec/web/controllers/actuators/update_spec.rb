require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/update'
require_relative '../../../../lib/usgard/commands/actuator/update'
require_relative '../../../../lib/usgard/commands/actuator/find_by_id'

describe Web::Controllers::Actuators::Update, type: :controller do
  let(:id) { '10' }
  let(:user) { instance_double(User, id: user_id) }
  let(:action) { described_class.new(update: update, find_by_id: find_by_id) }
  let(:user_id)  { 1 }
  let(:actuator) { Actuator.new }
  let(:update) { double(Usgard::Commands::Actuator::Update) }
  let(:find_by_id) { double(Usgard::Commands::Actuator::FindById) }

  before do
    stub_current_user!(user)
  end

  context 'when has a result' do
    before do
      allow(find_by_id).to receive(:call).and_return(actuator)
    end

    context 'and params is valid' do
      let(:actuator_params) do
        { name: 'luminosity switch', description: 'test', topic: 'luminosity_switch', visible: true, type: 'text' }
      end

      before do
        allow(update).to receive(:call).with(id, actuator_params).and_return(actuator)
      end

      it 'status is 302' do
        response = action.call(id: 10.to_s, actuator: actuator_params)

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
