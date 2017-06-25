require 'spec_helper'
require_relative '../../../../apps/web/controllers/actuators/create'

describe Web::Controllers::Actuators::Create do
  let(:action) { described_class.new }

  context 'when is successful' do
    let(:params) do
      { params:
        { actuators:
          { name: 'luminosity switch', description: 'test', topic: 'luminosity_switch', visible: true, type: 'text' }
        }
      }
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
